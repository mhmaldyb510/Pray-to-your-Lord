import 'package:flutter/material.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';

class ZekrTile extends StatelessWidget {
  final String zekr;
  final bool isSelected;
  final Function()? onTap;
  const ZekrTile({
    super.key,
    required this.zekr,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width - 80,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(120),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
            ),
          ],
          border:
              isSelected
                  ? Border(
                    right: BorderSide(
                      color: LightTheme.kSecondaryColor,
                      width: 4,
                    ),
                  )
                  : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(zekr, style: LightTheme.kH3TextStyle),
      ),
    );
  }
}
