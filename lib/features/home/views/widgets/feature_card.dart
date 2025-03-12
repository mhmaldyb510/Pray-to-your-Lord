import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_companion/core/cubits/navigation_cubit/navigation_cubit.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  const FeatureCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavigationCubit>(context).changeIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Colors.black.withAlpha(120),
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50),
              const SizedBox(height: 10),
              Text(title),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
