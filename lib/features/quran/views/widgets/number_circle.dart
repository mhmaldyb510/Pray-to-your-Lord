import 'package:flutter/material.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';

class NumberCircle extends StatelessWidget {
  final int number;
  const NumberCircle({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: LightTheme.kPrimaryColor,
      radius: 15,
      child: Text('$number', style: const TextStyle(color: Colors.white)),
    );
  }
}
