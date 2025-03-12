import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:jhijri/jHijri.dart';
import 'package:muslim_companion/generated/l10n.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: LightTheme.kSecondaryColor,
        border: Border(
          bottom: BorderSide(width: 4, color: LightTheme.kPrimaryColor),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).title, style: LightTheme.kH1TextStyle),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${DateFormat('EEEE').format(DateTime.now()).toLowerCase()}, ',
                style: LightTheme.kHeaderTextStyle,
              ),
              Text(
                '${DateTime.now().day} ',
                style: LightTheme.kHeaderTextStyle,
              ),
              Text(
                '${DateFormat('MMMM').format(DateTime.now()).toLowerCase()}, ',
                style: LightTheme.kHeaderTextStyle,
              ),
              Text(
                '${DateTime.now().year} | ',
                style: LightTheme.kHeaderTextStyle,
              ),
              Text('${JHijri.now().day}', style: LightTheme.kHeaderTextStyle),
              Text(
                ' ${JHijri.now().monthName}',
                style: LightTheme.kHeaderTextStyle,
              ),
              Text(' ${JHijri.now().year}', style: LightTheme.kHeaderTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
