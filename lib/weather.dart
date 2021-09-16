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

  static Future<dynamic> getCurrentWeather(String zipCode) async {
    late String _zipCode;
    if (zipCode.contains('-')) {
      _zipCode = zipCode;
    } else {
      _zipCode = zipCode.substring(0, 3) + '-' + zipCode.substring(3);
    }
    print(_zipCode);
    String url =
        'https://api.openweathermap.org/data/2.5/weather?zip=$_zipCode,JP&appid=6fbe4a724b915b0da6231a2b9ccc0aa0&lang=ja&units=metric';
    try {
      var result = await get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(result.body);
      print(data);
      Weather currentWeather = Weather(
        weatherDescription: data['weather'][0]['description'],
        temperature: data['main']['temp'],
        temperatureMax: data['main']['temp_max'],
        temperatureMin: data['main']['temp_min'],
        time: DateTime.now(),
      );
      return currentWeather;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
