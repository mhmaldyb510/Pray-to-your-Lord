part of 'mespaha_cubit.dart';

@immutable
sealed class MespahaState {}

final class MespahaInitial extends MespahaState {}

final class MespahaChanged extends MespahaState {}