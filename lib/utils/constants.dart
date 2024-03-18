double? height;
double? width;

class Images {
  static const String summerBackground = 'assets/images/summer_background.jpg';
  static const String autumnBackground = 'assets/images/autumn_background.jpg';
}

class AppStrings {
  static const String degree = '\u00B0';
  static const String cloudiness = 'Cloudiness';
  static const String humidity = 'Humidity';
  static const String wind = 'Wind';
  static const String rain = 'Rain';
  static const String visibility = 'Visibility';
  static const String pressure = 'Pressure';
  static const String aqi = 'AQI';
  static const String airQualityIndex = 'Air Quality Index';

  // days
  static const String today = 'Today';
  static const String tomorrow = 'Tomorrow';
  static const String monday = 'Monday';
  static const String tuesday = 'Tuesday';
  static const String wednesday = 'Wednesday';
  static const String thursday = 'Thursday';
  static const String friday = 'Friday';
  static const String saturday = 'Saturday';
  static const String sunday = 'Sunday';
}

class AppKeys {
  static const String apiKeyWeather = '15e274142fa3b55cae31942dd94973e0';
}

class AppUrls {
  static const String currentWeatherUrl =
      'https://api.openweathermap.org/data/2.5/weather?';
  static const String aqiUrl =
      'https://api.openweathermap.org/data/2.5/air_pollution?';
  static const String forecastUrl =
      'https://api.openweathermap.org/data/2.5/forecast?';
}

// https://api.openweathermap.org/data/2.5/weather?lat=28.704060&lon=77.102493&appid=15e274142fa3b55cae31942dd94973e0
