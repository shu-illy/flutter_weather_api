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
    required this.temperature,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.weatherDescription,
    required this.longitude,
    required this.latitude,
    required this.icon,
    required this.time,
    required this.rainyPercent,
  });
}
