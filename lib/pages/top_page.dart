import 'package:flutter/material.dart';
import 'package:flutter_weather_api/weather.dart';
import 'package:intl/intl.dart';

import '../zip_code.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather currentWeather = Weather(
    temperature: 0,
    temperatureMax: 0,
    temperatureMin: 0,
    weatherDescription: 'ー',
    time: DateTime.now(),
  );
  String address = 'ー';
  String errorMessage = '';
  List<Weather> hourlyWeather = [];
  // List<Weather> hourlyWeather = [
  //   Weather(
  //     temperature: 15,
  //     temperatureMax: 20,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 10),
  //   ),
  //   Weather(
  //     temperature: 20,
  //     temperatureMax: 30,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 11),
  //   ),
  //   Weather(
  //     temperature: 15,
  //     temperatureMax: 20,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 12),
  //   ),
  //   Weather(
  //     temperature: 20,
  //     temperatureMax: 30,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 13),
  //   ),
  //   Weather(
  //     temperature: 15,
  //     temperatureMax: 20,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 10),
  //   ),
  //   Weather(
  //     temperature: 20,
  //     temperatureMax: 30,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 11),
  //   ),
  //   Weather(
  //     temperature: 15,
  //     temperatureMax: 20,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 12),
  //   ),
  //   Weather(
  //     temperature: 20,
  //     temperatureMax: 30,
  //     temperatureMin: 10,
  //     weatherDescription: '晴れ',
  //     time: DateTime(2021, 4, 1, 13),
  //   ),
  // ];

  List<Weather> dailyWeather = [
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 1)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 3)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
    Weather(
        temperatureMax: 20,
        temperatureMin: 15,
        rainyPercent: 0,
        time: DateTime(2021, 10, 2)),
  ];

  List<String> weekDay = ['月', '火', '水', '木', '金', '土', '日'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: 200,
                child: TextField(
                    onSubmitted: (value) async {
                      // 郵便番号から住所を検索
                      Map<String, String> response =
                          await ZipCode.searchAddressFromZipCode(value);
                      errorMessage = response['message'] ?? '';
                      if (response.containsKey('address')) {
                        address = response['address']!;
                        currentWeather = await Weather.getCurrentWeather(value);
                        hourlyWeather = await Weather.getHourlyWeather(
                            lon: currentWeather.longitude,
                            lat: currentWeather.latitude);
                      }
                      print(hourlyWeather);
                      setState(() {});
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: '郵便番号を入力'))),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 50),
            Text(address, style: TextStyle(fontSize: 25)),
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
              child: hourlyWeather == []
                  ? Container()
                  : Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: hourlyWeather.map((weather) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          child: Column(
                            children: [
                              Text('${DateFormat('H').format(weather.time)}時'),
                              Image.network(
                                  'https://openweathermap.org/img/wn/${weather.icon}.png',
                                  width: 30),
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: dailyWeather.map((weather) {
                      return Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 100,
                                child: Text(
                                    '${weekDay[dailyWeather[0].time.weekday - 1]}曜日')),
                            Row(
                              children: [
                                Icon(Icons.wb_sunny_sharp),
                                Text('${dailyWeather[0].rainyPercent}%',
                                    style: TextStyle(color: Colors.blueAccent)),
                              ],
                            ),
                            Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${dailyWeather[0].temperatureMax}',
                                      style: TextStyle(fontSize: 16)),
                                  Text('${dailyWeather[0].temperatureMin}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Colors.black.withOpacity(0.4))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
