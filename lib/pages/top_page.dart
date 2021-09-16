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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text('大阪市', style: TextStyle(fontSize: 25)),
            Text(currentWeather.weatherDescription),
            Text('${currentWeather.temperature}℃',
                style: TextStyle(fontSize: 80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('最高: ${currentWeather.temperatureMax}℃'),
                ),
                Text('最低: ${currentWeather.temperatureMin}℃')
              ],
            )
          ],
        ),
      ),
    );
  }
}
