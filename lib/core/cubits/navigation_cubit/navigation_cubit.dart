import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(NavigationChanged());
  }
}
