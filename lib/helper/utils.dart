import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UvIndex {
  static String mapUviValueToString({required dynamic uvi}) {
    String uvIndex;
    if (uvi <= 100) {
      return uvIndex = 'Low';
    } else if (uvi <= 500) {
      return uvIndex = 'Medium';
    } else if (uvi <= 1000) {
      return uvIndex = 'High';
    } else if (uvi <= 5000) {
      return uvIndex = 'Very High';
    } else if (uvi >= 5001) {
      return uvIndex = 'Extreme';
    } else {
      uvIndex = 'Unknown';
    }
    return uvIndex;
  }
}

class MapString {
  static Widget mapInputToWeather(BuildContext context, String input) {
    String text;
    switch (input) {
      case 'Tornado':
        text = 'Tornado';
        break;
      case 'Thunderstorm':
        text = 'Thunderstorm';
        break;
      case 'Drizzle':
        text = 'Drizzly';
        break;
      case 'Rain':
        text = 'Raining';
        break;
      case 'Snow':
        text = 'Snowing';
        break;
      case 'Mist':
        text = 'Misty';
        break;
      case 'fog':
        text = 'Foggy';
        break;
      case 'Smoke':
        text = 'Smoky';
        break;
      case 'Squall':
        text = 'Squally';
        break;
      case 'Haze':
        text = 'Hazy';
        break;
      case 'Dust':
        text = 'Dusty';
        break;
      case 'Sand':
        text = 'Sandy';
        break;
      case 'Ash':
        text = 'Ashy';
        break;
      case 'Clear':
        text = "Sunny";
        break;
      case 'Clouds':
        text = "Cloudy";
        break;
      default:
        text = "No Info";
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
  static String mapInputToPIc(BuildContext context, String? input) {
    String text;
    switch (input) {
      case 'Tornado':
        text = 'tornado.jpeg';
        break;
      case 'Thunderstorm':
        text = 'thunderstorm.jpeg';
        break;
      case 'Drizzle':
        text = 'drizzle.jpeg';
        break;
      case 'Rain':
        text = 'rain.jpeg';
        break;
      case 'Snow':
        text = 'snow.jpeg';
        break;
      case 'Mist':
        text = 'mist.jpeg';
        break;
      case 'fog':
        text = 'fog.jpeg';
        break;
      case 'Smoke':
        text = 'smoky.jpeg';
        break;
      case 'Squall':
        text = 'squally.jpeg';
        break;
      case 'Haze':
        text = 'hazy.jpeg';
        break;
      case 'Dust':
        text = 'dusty.jpeg';
        break;
      case 'Sand':
        text = 'sandy.jpeg';
        break;
      case 'Ash':
        text = 'ashy.jpeg';
        break;
      case 'Clear':
        text = "sunny.jpeg";
        break;
      case 'Clouds':
        text = "cloud.jpeg";
        break;
      default:
        text = "noinfo.jpeg";
    }
    return text;
    // return Text(
    //   text,
    //   style: TextStyle(
    //     fontSize: 15,
    //   ),
    // );
  }

  static Icon mapStringToIcon(String input, double iconSize) {
    IconData icon;
    switch (input) {
      case 'Thunderstorm':
        icon = MdiIcons.weatherLightningRainy;
        break;
      case 'Drizzle':
        icon = MdiIcons.weatherPartlyRainy;
        break;
      case 'Rain':
        icon = MdiIcons.weatherRainy;
        break;
      case 'Snow':
        icon = MdiIcons.weatherSnowy;
        break;
      case 'Clear':
        icon = MdiIcons.weatherSunny;
        break;
      case 'Clouds':
        icon = MdiIcons.weatherCloudy;
        break;
      case 'Mist':
        icon = MdiIcons.weatherFog;
        break;
      case 'fog':
        icon = MdiIcons.weatherFog;
        break;
      case 'Smoke':
        icon = MdiIcons.smoke;
        break;
      case 'Haze':
        icon = MdiIcons.weatherHazy;
        break;
      case 'Dust':
      case 'Sand':
      case 'Ash':
        icon = MdiIcons.weatherDust;
        break;
      case 'Squall':
      case 'Tornado':
        icon = MdiIcons.weatherTornado;
        break;
      default:
        icon = MdiIcons.weatherCloudy;
    }
    return Icon(icon, size: iconSize, color: Colors.blue);
  }
}
