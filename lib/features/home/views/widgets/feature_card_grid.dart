import 'package:flutter/material.dart';
import 'package:muslim_companion/features/home/views/widgets/feature_card.dart';

class FeatureCardGrid extends StatelessWidget {
  final List<FeatureCard> featureCards;
  const FeatureCardGrid({super.key, required this.featureCards});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => featureCards[index],
        itemCount: featureCards.length,
      ),
    );
  }
}
