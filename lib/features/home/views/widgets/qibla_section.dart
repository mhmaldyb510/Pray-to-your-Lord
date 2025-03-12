import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/generated/l10n.dart';

class QiblaSection extends StatefulWidget {
  const QiblaSection({super.key});

  @override
  State<QiblaSection> createState() => _QiblaSectionState();
}

class _QiblaSectionState extends State<QiblaSection> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    try {
  final locationStatus = await FlutterQiblah.checkLocationStatus();
  if (locationStatus.enabled &&
      locationStatus.status == LocationPermission.denied) {
    await FlutterQiblah.requestPermissions();
    final s = await FlutterQiblah.checkLocationStatus();
    _locationStreamController.sink.add(s);
  } else {
    _locationStreamController.add(locationStatus);
  }
} on Exception catch (e) {
  debugPrint(e.toString());
}
  }

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  dispose() {
    _locationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return const QiblaCompassWidget();

              case LocationPermission.denied:
                return const Center(
                  child: Text('Location permission denied'),
                );
              case LocationPermission.deniedForever:
                return const Center(
                  child: Text('Location permission permanently denied'),
                );
              default:
                return const SizedBox.shrink();
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class QiblaCompassWidget extends StatefulWidget {
  const QiblaCompassWidget({super.key});

  @override
  State<QiblaCompassWidget> createState() => _QiblaCompassWidgetState();
}

class _QiblaCompassWidgetState extends State<QiblaCompassWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
         Text(S.of(context).qiblah, style: LightTheme.kH3TextStyle),
        const SizedBox(height: 20),
        StreamBuilder(
          stream: FlutterQiblah.qiblahStream,
          builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final qiblahDirection = snapshot.data!;
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  decoration: BoxDecoration(
                    color: const Color(0xfff8f9fa),
                    borderRadius: BorderRadius.circular(75),
                    border: Border.all(color: const Color(0xff27ae60), width: 5),
                  ),
                  alignment: Alignment.center,
                ),
                Transform.rotate(
                  angle: (qiblahDirection.direction * pi / 180) - 3 * pi / 4,
                  child: const Icon(
                    FlutterIslamicIcons.qibla,
                    size: 145,
                    color: LightTheme.kSecondaryColor,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
