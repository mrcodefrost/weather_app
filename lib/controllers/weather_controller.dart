import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../models/weather_model.dart';
import '../utils/constants.dart';

class WeatherController extends GetxController {
  RxBool isLoading = true.obs;

  final logger = Logger();

  // RxBool isLoading = true as RxBool;
  // : In this line, true as RxBool attempts to cast
  // the boolean value true to the type RxBool. However, this is not valid because RxBool
  // is not a subtype of bool, and casting a boolean value to RxBool directly like this won't work.

  Rx<WeatherModel?> weather = Rx<WeatherModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          '${AppUrls.currentWeatherUrl}lat=28.704060&lon=77.102493&appid=${AppKeys.apiKeyWeather}'));
      if (response.statusCode == 200) {
        // var data = json.decode(response.body);
        // weather.value = weatherModelFromJson(json.encode(data));
        weather.value = weatherModelFromJson(response.body);
        logger.d('Response from Weather Controller:  ${response.body}');
      } else {
        // Handle error
        logger.e('HTTP Response != 200 in WeatherController');
      }
    } catch (error) {
      logger.e('Error in fetchData of Weather Controller ${error.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
