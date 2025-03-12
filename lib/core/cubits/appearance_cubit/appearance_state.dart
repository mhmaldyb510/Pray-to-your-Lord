part of 'appearance_cubit.dart';

@immutable
sealed class AppearanceState {}

final class AppearanceInitial extends AppearanceState {}

final class LanguageChanged extends AppearanceState {
  final String lang;

  LanguageChanged({required this.lang});
}
