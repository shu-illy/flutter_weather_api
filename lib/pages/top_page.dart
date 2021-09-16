import 'package:flutter/material.dart';
import 'package:flutter_weather_api/weather.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather currentWeather = Weather(
    temperature: 15,
    temperatureMax: 20,
    temperatureMin: 10,
    weatherDescription: '晴れ',
    icon: '',
    latitude: 50,
    longitude: 135,
    rainyPercent: 10,
    time: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('天気を表示')),
    );
  }
}