import 'package:flutter/material.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/features/home/data/models/prayer_model.dart';
import 'package:muslim_companion/features/home/data/services/get_prayer_times.dart';
import 'package:muslim_companion/features/home/views/widgets/prayer_tile.dart';
import 'package:muslim_companion/generated/l10n.dart';

class PrayerTimesList extends StatelessWidget {
  const PrayerTimesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xfff8f9fa),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).prayerTimes, style: LightTheme.kH2TextStyle),
          const SizedBox(height: 15),
          FutureBuilder(
            future: getPrayerTimes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PrayerModel> prayers = snapshot.data as List<PrayerModel>;
                return Column(
                  children: prayers.map((e) => PrayerTile(prayer: e)).toList(),
                );
              } else if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Text('something went wrong please try again later');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
