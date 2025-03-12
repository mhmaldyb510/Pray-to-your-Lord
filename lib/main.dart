import 'package:flutter/material.dart';
import 'package:muslim_companion/my_app.dart';
import 'package:quran_library/quran_library.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranLibrary().init();
  runApp(const MyApp());
}
