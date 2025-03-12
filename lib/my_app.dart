import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_companion/core/cubits/appearance_cubit/appearance_cubit.dart';
import 'package:muslim_companion/core/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/core/widgets/main_scaffold.dart';
import 'package:muslim_companion/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppearanceCubit()..getLanguage(),
      child: BlocBuilder<AppearanceCubit, AppearanceState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale(BlocProvider.of<AppearanceCubit>(context).language),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: LightTheme.theme,
            home: BlocProvider(
              create: (context) => NavigationCubit(),
              child: const MainScaffold(),
            ),
          );
        },
      ),
    );
  }
}
