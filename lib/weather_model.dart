import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart'; 

class Weather {
  final String cityName;
  final String description;
  final double temperature;

  Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temperature:
          json['main']['temp'] - 273.15, 
    );
  }
}

Future<Weather> fetchWeather(String city) async {
  final response = await http.get(
    Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
