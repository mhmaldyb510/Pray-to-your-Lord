import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_companion/core/cubits/appearance_cubit/appearance_cubit.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(S.of(context).settings, style: LightTheme.kH2TextStyle),
        const SizedBox(height: 20),
        ListTile(
          title: Text(S.of(context).language),
          trailing: DropdownButton<String>(
            value: BlocProvider.of<AppearanceCubit>(context).language,

            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'ar', child: Text('العربية')),
            ],
            onChanged: (value) async {
              await BlocProvider.of<AppearanceCubit>(
                context,
              ).changeLanguage(value!);
            },
          ),
        ),
      ],
    );
  }
}
