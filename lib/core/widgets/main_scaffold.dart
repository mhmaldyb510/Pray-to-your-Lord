import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_companion/core/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:muslim_companion/core/widgets/app_header.dart';
import 'package:muslim_companion/core/widgets/app_nav_bar.dart';
import 'package:muslim_companion/features/home/views/screens/home_screen.dart';
import 'package:muslim_companion/features/mespaha/views/screens/mespaha_screen.dart';
import 'package:muslim_companion/features/quran/views/screens/quran_screen.dart';
import 'package:muslim_companion/features/settings/views/screens/settings_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final List<Widget> _bodies = [
    const HomeScreen(),
    const QuranScreen(),
    const MespahaScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return PopScope(
          canPop: BlocProvider.of<NavigationCubit>(context).currentIndex == 0,
          onPopInvokedWithResult: (didPop, result) {
            BlocProvider.of<NavigationCubit>(context).changeIndex(0);
          },
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(93),
              child: HomeHeader(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IndexedStack(
                index: BlocProvider.of<NavigationCubit>(context).currentIndex,
                children: _bodies,
              ),
            ),
            bottomNavigationBar: AppNavBar(
              onSelected: (value) {
                BlocProvider.of<NavigationCubit>(context).changeIndex(value);
              },
            ),
          ),
        );
      },
    );
  }
}
