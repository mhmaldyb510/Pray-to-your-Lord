import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'appearance_state.dart';

class AppearanceCubit extends Cubit<AppearanceState> {
  AppearanceCubit() : super(AppearanceInitial());

  String language = 'ar';

  getLanguage() async {
    var pref = await SharedPreferences.getInstance();
    language = pref.getString('language') ?? 'ar';
    emit(LanguageChanged(lang: language));
  }

  Future<void> changeLanguage(String lang) async {
    language = lang;
    var pref = await SharedPreferences.getInstance();
    await pref.setString('language', lang);
    emit(LanguageChanged(lang: lang));
  }
}
