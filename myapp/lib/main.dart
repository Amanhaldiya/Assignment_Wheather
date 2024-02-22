// main.dart
import 'package:flutter/material.dart';
import 'package:myapp/Providers/provider.dart';
import 'package:myapp/UI/UI.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, _) {
          return MaterialApp(
            
            title: 'Weather App',
            theme: weatherProvider.appTheme,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

