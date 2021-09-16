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
}
