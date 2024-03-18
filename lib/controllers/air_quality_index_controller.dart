import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intro_widgets/models/air_quality_index_model.dart';
import 'package:intro_widgets/utils/constants.dart';
import 'package:logger/logger.dart';

class AirQualityIndexController extends GetxController {
  RxBool isLoading = true.obs;
  final logger = Logger();
  Rx<AirQualityIndexModel?> airQuality = Rx<AirQualityIndexModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          '${AppUrls.aqiUrl}lat=50&lon=50&appid=${AppKeys.apiKeyWeather}'));

      if (response.statusCode == 200) {
        airQuality.value = airQualityIndexModelFromJson(response.body);
        logger.d('Response from AirQuality Controller:  ${response.body}');
      } else {
        logger.d('HTTP response code != 200 in AirQualityIndexController');
      }
    } catch (e) {
      logger.e('Error in fetching AQI: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
