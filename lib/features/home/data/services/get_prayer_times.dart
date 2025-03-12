import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:muslim_companion/features/home/data/models/prayer_model.dart';
import 'package:muslim_companion/helpers/get_user_location.dart';
import 'package:muslim_companion/helpers/php_time_zone.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<PrayerModel>> getPrayerTimes() async {
  var cachedPrayer = await getPrayerFromCache();
  if (cachedPrayer.isNotEmpty) {
    return cachedPrayer;
  }
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String timeZone = getPHPTimezone();
  String latitude = await getUserLocation().then(
    (value) => value.latitude.toString(),
  );
  String longitude = await getUserLocation().then(
    (value) => value.longitude.toString(),
  );
  const String baseUrl = 'https://api.aladhan.com/v1/timings';
  Dio dio = Dio();
  try {
    Response response = await dio.get(
      '$baseUrl/$date?latitude=$latitude&longitude=$longitude&timezonestring=$timeZone',
    );
    Map<String, dynamic> jsonData =
        response.data['data']['timings'] as Map<String, dynamic>;
    List<PrayerModel> prayers = [];
    for (String key in jsonData.keys) {
      log(
        "prayers.add(PrayerModel(name: '$key', time: pref.getString('$key')));",
      );
      prayers.add(PrayerModel(name: key, time: jsonData[key]));
      var pref = await SharedPreferences.getInstance();
      await pref.setString(key, jsonData[key]);
    }
    return prayers;
  } on Exception catch (e) {
    log(e.toString());
    rethrow;
  }
}

getPrayerFromCache() async {
  var pref = await SharedPreferences.getInstance();
  List<PrayerModel> prayers = [];

  if (pref.getString('Fajr') != null) {
    prayers.add(PrayerModel(name: 'Fajr', time: pref.getString('Fajr')!));
    prayers.add(PrayerModel(name: 'Sunrise', time: pref.getString('Sunrise')!));
    prayers.add(PrayerModel(name: 'Dhuhr', time: pref.getString('Dhuhr')!));
    prayers.add(PrayerModel(name: 'Asr', time: pref.getString('Asr')!));
    prayers.add(PrayerModel(name: 'Sunset', time: pref.getString('Sunset')!));
    prayers.add(PrayerModel(name: 'Maghrib', time: pref.getString('Maghrib')!));
    prayers.add(PrayerModel(name: 'Isha', time: pref.getString('Isha')!));
    prayers.add(PrayerModel(name: 'Imsak', time: pref.getString('Imsak')!));
    prayers.add(
      PrayerModel(name: 'Midnight', time: pref.getString('Midnight')!),
    );
    prayers.add(
      PrayerModel(name: 'Firstthird', time: pref.getString('Firstthird')!),
    );
    prayers.add(
      PrayerModel(name: 'Lastthird', time: pref.getString('Lastthird')!),
    );
  }
  return prayers;
}
