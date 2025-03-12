import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mespaha_state.dart';

class MespahaCubit extends Cubit<MespahaState> {
  MespahaCubit() : super(MespahaInitial());

  int total = 0;
  int current = 0;
  int zekrIndex = 0;

  void increment() {
    total++;
    current++;
    emit(MespahaChanged());
  }

  void reset() {
    total = 0;
    current = 0;
    emit(MespahaChanged());
  }

  void changeZekr(int index) {
    zekrIndex = index;
    current = 0;
    emit(MespahaChanged());
  }
}
