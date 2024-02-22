// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherAPIService {
  static const String apiKey = '11199a5c236de9cba23a5d1f1832a2a8'; // Your OpenWeatherMap API key

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
