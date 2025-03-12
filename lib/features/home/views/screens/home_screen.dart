import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:muslim_companion/features/home/views/widgets/feature_card.dart';
import 'package:muslim_companion/features/home/views/widgets/feature_card_grid.dart';
import 'package:muslim_companion/features/home/views/widgets/prayer_times_list.dart';
import 'package:muslim_companion/features/home/views/widgets/qibla_section.dart';
import 'package:muslim_companion/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
    return ListView(
      children: [
        FeatureCardGrid(
          featureCards: [
            FeatureCard(
              icon: FlutterIslamicIcons.solidQuran2,
              title: S.of(context).quran,
              index: 1,
            ),
            FeatureCard(
              icon: FlutterIslamicIcons.solidTasbihHand,
              index: 2,
              title: S.of(context).masbaha,
            ),
          ],
        ),
        FutureBuilder(
          future: deviceSupport,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return const QiblaSection();
              } else {
                return const SizedBox.shrink();
              }
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        const PrayerTimesList(),
      ],
    );
  }
}
