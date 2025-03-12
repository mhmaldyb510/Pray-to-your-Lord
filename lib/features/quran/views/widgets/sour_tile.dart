import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_companion/core/data/quran.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/features/quran/views/screens/reading_screen.dart';
import 'package:muslim_companion/features/quran/views/widgets/number_circle.dart';
import 'package:muslim_companion/generated/l10n.dart';

class SourTile extends StatelessWidget {
  final AyatSour sour;
  final bool? isFirst;
  final bool? isLast;
  const SourTile({super.key, this.isFirst, this.isLast, required this.sour});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ReadingScreen(index: sour.index),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isFirst! ? 10 : 0),
            topRight: Radius.circular(isFirst! ? 10 : 0),
            bottomLeft: Radius.circular(isLast! ? 10 : 0),
            bottomRight: Radius.circular(isLast! ? 10 : 0),
          ),

          border: const Border(
            bottom: BorderSide(color: Color(0xffeaeaea), width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(120),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            NumberCircle(number: sour.index),
            const SizedBox(width: 10),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getSurahEnglishName(sour.arName),
                    style: LightTheme.kNormalTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${sour.ayat} ${S.of(context).ayat}',
                    style: LightTheme.kInfoTextStyle,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(sour.arName, style: LightTheme.kNormalTextStyle),
          ],
        ),
      ),
    );
  }
}
