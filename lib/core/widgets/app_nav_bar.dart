import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:muslim_companion/core/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/generated/l10n.dart';

class AppNavBar extends StatefulWidget {
  final ValueChanged<int>? onSelected;

  const AppNavBar({super.key, this.onSelected});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: LightTheme.kPrimaryColor.withAlpha(120),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: BlocProvider.of<NavigationCubit>(context).currentIndex,
      onDestinationSelected: (value) {
        setState(() {
          widget.onSelected!(value);
        });
      },
      destinations: [
        NavigationDestination(
          icon: const Icon(FlutterIslamicIcons.mosque),
          selectedIcon: const Icon(FlutterIslamicIcons.solidMosque),
          label: S.of(context).home,
        ),
        NavigationDestination(
          icon: const Icon(FlutterIslamicIcons.quran),
          selectedIcon: const Icon(FlutterIslamicIcons.solidQuran2),
          label: S.of(context).quran,
        ),
        NavigationDestination(
          icon: const Icon(FlutterIslamicIcons.tasbih3),
          selectedIcon: const Icon(FlutterIslamicIcons.solidTasbihHand),
          label: S.of(context).masbaha,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings),
          label: S.of(context).settings,
        ),
      ],
    );
  }
}
