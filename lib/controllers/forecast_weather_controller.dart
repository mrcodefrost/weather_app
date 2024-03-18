import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:intro_widgets/models/forecast_weather_model.dart';
import 'package:intro_widgets/utils/constants.dart';
import 'package:logger/logger.dart';

class ForecastWeatherController extends GetxController {
  final logger = Logger();
  RxBool isLoading = true.obs;
  Rx<ForecastWeatherModel?> forecastWeather = Rx<ForecastWeatherModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          '${AppUrls.forecastUrl}lat=44.34&lon=10.99&appid=${AppKeys.apiKeyWeather}'));
      if (response.statusCode == 200) {
        forecastWeather.value = forecastWeatherModelFromJson(response.body);
        logger.d('Response from ForecastController: ${response.body}');
      } else {
        logger.d('HTTP response code != 200 in ForecastController');
      }
    } catch (error) {
      logger.e('Error in fetching Forecast: ${error.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
