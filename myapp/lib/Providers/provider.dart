// weather_provider.dart

import 'package:flutter/material.dart';
import 'package:myapp/ApiCalls/apis_calls.dart';


class WeatherProvider extends ChangeNotifier {
  final WeatherAPIService _apiService = WeatherAPIService();
  Map<String, dynamic>? _weatherData;
  ThemeData _appTheme = ThemeData.light();

  Map<String, dynamic>? get weatherData => _weatherData;
  ThemeData get appTheme => _appTheme;

  void toggleTheme() {
    _appTheme = _appTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  Future<void> fetchWeatherData(double lat, double lon) async {
    try {
      _weatherData = await _apiService.fetchWeather(lat, lon);
      notifyListeners();
    } catch (e) {
      print('Error fetching weather data: $e');
      _weatherData = null;
      notifyListeners();
    }
  }
}
