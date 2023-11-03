import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:module_11/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String jsonString = '''[
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]''';

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherData = parseWeather(jsonString);
    return MaterialApp(
      title: 'Weather Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Weather Information')),
        body: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                title: Text(weatherData[index].city),
                subtitle: Text(
                  'Temperature: ${weatherData[index].temperature}°C\n'
                      'Condition: ${weatherData[index].condition}\n'
                      'Humidity: ${weatherData[index].humidity}%\n'
                      'Wind Speed: ${weatherData[index].windSpeed} m/s',
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}


List<Weather> parseWeather(String jsonString) {
  List<dynamic> list = jsonDecode(jsonString) as List<dynamic>;
  return list.map((data) => Weather.fromJson(data)).toList();
}
