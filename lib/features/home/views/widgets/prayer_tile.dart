import 'package:flutter/material.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/features/home/data/models/prayer_model.dart';
import 'package:muslim_companion/helpers/arabic_prayer_names.dart';
import 'package:muslim_companion/helpers/convert_to_am_pm.dart';

class PrayerTile extends StatelessWidget {
  final PrayerModel prayer;
  const PrayerTile({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffeaeaea), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerNames[prayer.name]!,
            style: const TextStyle(
              color: LightTheme.kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            convertToAmPm(prayer.time),
            style: const TextStyle(
              color: LightTheme.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
