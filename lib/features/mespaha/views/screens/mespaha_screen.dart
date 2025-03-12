import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_companion/core/themes/light_theme.dart';
import 'package:muslim_companion/features/mespaha/cubit/mespaha_cubit.dart';
import 'package:muslim_companion/features/mespaha/views/widgets/zekr_tile.dart';
import 'package:muslim_companion/generated/l10n.dart';

class MespahaScreen extends StatelessWidget {
  const MespahaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MespahaCubit(),
      child: BlocBuilder<MespahaCubit, MespahaState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width, height: 30),
                Text(S.of(context).masbaha, style: LightTheme.kH2TextStyle),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width / 2,
                  height: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: LightTheme.kPrimaryColor,
                      width: 5,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(120),
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        BlocProvider.of<MespahaCubit>(
                          context,
                        ).current.toString(),
                        style: const TextStyle(
                          color: LightTheme.kSecondaryColor,
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).width / 10),
                      Text(
                        '${S.of(context).total}: ${BlocProvider.of<MespahaCubit>(context).total}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<MespahaCubit>(context).increment();
                      },
                      child: const Text(
                        '+1',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<MespahaCubit>(context).reset();
                      },
                      child: Text(
                        S.of(context).reset,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ZekrTile(
                  zekr: 'سبحان الله',
                  isSelected:
                      BlocProvider.of<MespahaCubit>(context).zekrIndex == 0,
                  onTap:
                      () =>
                          BlocProvider.of<MespahaCubit>(context).changeZekr(0),
                ),

                ZekrTile(
                  zekr: 'استغفر الله العظيم',
                  isSelected:
                      BlocProvider.of<MespahaCubit>(context).zekrIndex == 1,
                  onTap:
                      () =>
                          BlocProvider.of<MespahaCubit>(context).changeZekr(1),
                ),
                ZekrTile(
                  zekr: 'لا إله إلا الله',
                  isSelected:
                      BlocProvider.of<MespahaCubit>(context).zekrIndex == 2,
                  onTap:
                      () =>
                          BlocProvider.of<MespahaCubit>(context).changeZekr(2),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
