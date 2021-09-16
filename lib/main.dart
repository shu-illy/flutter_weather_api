import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_weather_api/pages/top_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const locale = Locale("ja", "JP");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      home: TopPage(),
    );
  }
}

// TODO: 検索欄への入力内容に間違いがある際にエラー表示
// TODO: 現在の天気情報を取得
// TODO: 現在の天気情報をdartで取得
// TODO: 取得した情報から現在の天気情報を表示
// TODO: 1時間ごとの天気情報を取得
// TODO: 取得した情報から1時間ごとの天気情報を表示
// TODO: 日毎の天気情報を取得
// TODO: 取得した情報から日毎の天気情報を表示