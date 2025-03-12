import 'package:flutter_bloc/flutter_bloc.dart';

class MespahaCubit extends Cubit<int> {
  MespahaCubit() : super(0);

  void increment() => emit(state + 1);

  void tripleIncrement() => emit(state + 3);

  void reset() => emit(0);
}
