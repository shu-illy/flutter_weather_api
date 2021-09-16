import 'package:flutter/material.dart';
import 'package:flutter_weather_api/weather.dart';
import 'package:intl/intl.dart';

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
    time: DateTime.now(),
  );
  List<Weather> hourlyWeather = [
    Weather(
      temperature: 15,
      temperatureMax: 20,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 10),
    ),
    Weather(
      temperature: 20,
      temperatureMax: 30,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 11),
    ),
    Weather(
      temperature: 15,
      temperatureMax: 20,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 12),
    ),
    Weather(
      temperature: 20,
      temperatureMax: 30,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 13),
    ),
    Weather(
      temperature: 15,
      temperatureMax: 20,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 10),
    ),
    Weather(
      temperature: 20,
      temperatureMax: 30,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 11),
    ),
    Weather(
      temperature: 15,
      temperatureMax: 20,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 12),
    ),
    Weather(
      temperature: 20,
      temperatureMax: 30,
      temperatureMin: 10,
      weatherDescription: '晴れ',
      time: DateTime(2021, 4, 1, 13),
    ),
  ];

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
            ),
            SizedBox(height: 50),
            Divider(height: 0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: hourlyWeather.map((weather) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Text('${DateFormat('H').format(weather.time)}時'),
                        Text('${weather.rainyPercent}',
                            style: TextStyle(color: Colors.blueAccent)),
                        Icon(Icons.wb_sunny_sharp),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('${weather.temperature}',
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
