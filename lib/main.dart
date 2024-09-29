import 'package:flutter/material.dart';
import 'get_started.dart';
import 'weather_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedPage(),
        '/weather': (context) => WeatherHomePage(),
      },
    );
  }
}
