import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  late int temperature;
  late int temperatureMax;
  late int temperatureMin;
  late String weatherDescription; //天気状態
  late double longitude; //経度
  late double latitude; //緯度
  late String icon; //天気情報のアイコン画像
  late DateTime time; //日時
  late int rainyPercent; //降水確率

  Weather({
    this.temperature = 15,
    this.temperatureMax = 20,
    this.temperatureMin = 10,
    this.weatherDescription = '',
    this.longitude = 135,
    this.latitude = 50,
    this.icon = '',
    required this.time,
    this.rainyPercent = 10,
  });
  static String publicParameter =
      'appid=6fbe4a724b915b0da6231a2b9ccc0aa0&lang=ja&units=metric';
  // static double lon = 136.9763;
  // static double lat = 35.0878;
  static Future<Weather> getCurrentWeather(String zipCode) async {
    late String _zipCode;
    if (zipCode.contains('-')) {
      _zipCode = zipCode;
    } else {
      _zipCode = zipCode.substring(0, 3) + '-' + zipCode.substring(3);
    }
    print(_zipCode);
    String url =
        'https://api.openweathermap.org/data/2.5/weather?zip=$_zipCode,JP&${publicParameter}';
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      print(data);
      Weather currentWeather = Weather(
        weatherDescription: data['weather'][0]['description'],
        temperature: data['main']['temp'].toInt(),
        temperatureMax: data['main']['temp_max'].toInt(),
        temperatureMin: data['main']['temp_min'].toInt(),
        longitude: data['coord']['lon'],
        latitude: data['coord']['lat'],
        time: DateTime.now(),
      );
      return currentWeather;
    } catch (e) {
      print(e);
      throw '天気を取得できませんでした';
    }
  }

  static Future<List<Weather>> getHourlyWeather(
      {required double lon, required double lat}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&${publicParameter}&exclude=minutely';
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      // print(data);
      List<dynamic> hourlyWeatherData = data['hourly'];
      // print('hourly data:');
      // print(hourlyWeatherData);
      List<Weather> hourlyWeather = hourlyWeatherData.map((weather) {
        return Weather(
            time: DateTime.fromMillisecondsSinceEpoch(weather['dt'] * 1000),
            temperature: weather['temp'].toInt(),
            icon: weather['weather'][0]['icon']);
      }).toList();
      // print('時刻:');
      // print(hourlyWeather[0].time);
      // print(hourlyWeather[1].time);
      // print(hourlyWeather[1].icon);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
