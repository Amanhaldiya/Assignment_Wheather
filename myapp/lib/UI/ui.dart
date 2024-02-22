import 'package:flutter/material.dart';
import 'package:myapp/Providers/provider.dart';
import 'package:myapp/Service_loc/loc_fetch.dart';
import 'package:provider/provider.dart';







class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final locationService = LocationService();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              weatherProvider.toggleTheme();
            },
            icon: const Icon(Icons.lightbulb_outline),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (weatherProvider.weatherData == null)
              const CircularProgressIndicator()
            else
              Column(
                children: [
                  Text(
                    '${weatherProvider.weatherData!['main']['temp']}°C',
                    style: const TextStyle(fontSize: 32),
                  ),
                  Text(
                    weatherProvider.weatherData!['weather'][0]['description'],
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final position = await locationService.getCurrentLocation();
          weatherProvider.fetchWeatherData(
              position.latitude, position.longitude);
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
