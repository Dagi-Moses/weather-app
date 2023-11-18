import 'package:flutter/cupertino.dart';

class Weather with ChangeNotifier {
  final double temp;
  final double tempMax;
  final double tempMin;
  final double lat;
  final double long;
  final double feelsLike;
  final int pressure;
  final String description;
  final String currently;
  final int humidity;
  final int visibility;
  final double windSpeed;
   String cityName ;

  Weather({
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.lat,
    required this.long,
    required this.feelsLike,
    required this.pressure,
    required this.description,
    required this.currently,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
     this.cityName = 'name',
  });

 factory Weather.fromJson(Map<String, dynamic> json) {
  return Weather(
    temp: (json['main']['temp'] as num).toDouble(),
    tempMax: (json['main']['temp_max'] as num).toDouble(),
    tempMin: (json['main']['temp_min'] as num).toDouble(),
    lat: (json['coord']['lat'] as num).toDouble(),
    long: (json['coord']['lon'] as num).toDouble(),
    feelsLike: (json['main']['feels_like'] as num).toDouble(),
    pressure: json['main']['pressure'],
    description: json['weather'][0]['description'],
    currently: json['weather'][0]['main'],
    humidity: json['main']['humidity'],
    visibility: json['visibility'],
    windSpeed: (json['wind']['speed'] as num).toDouble(),
    cityName: json['name'] ?? 'name', // Provide a default value for cityName
  );
}

}
