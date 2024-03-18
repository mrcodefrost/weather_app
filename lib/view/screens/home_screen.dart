import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intro_widgets/controllers/air_quality_index_controller.dart';
import 'package:intro_widgets/controllers/forecast_weather_controller.dart';
import 'package:intro_widgets/utils/constants.dart';
import 'package:intro_widgets/view/components/blurred_box.dart';
import 'package:intro_widgets/view/components/custom_vertical_divider.dart';
import 'package:intro_widgets/view/components/weather_info_icon.dart';

import '../../controllers/weather_controller.dart';
import '../components/weather_summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    final AirQualityIndexController airQualityIndexController =
        Get.put(AirQualityIndexController());
    final ForecastWeatherController forecastWeatherController =
        Get.put(ForecastWeatherController());
    return Scaffold(
      body: Container(
        // background image
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.summerBackground), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                // Location Bar Row
                BlurredBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            height: 30,
                            // color: Colors.black,
                            // color: Colors.transparent,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Obx(
                            () => weatherController.isLoading.value
                                ? const CircularProgressIndicator()
                                : Text(
                                    weatherController.weather.value?.name ??
                                        'Location',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.drag_handle_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Current Temperature Row
                Obx(
                  () => weatherController.isLoading.value
                      ? const CircularProgressIndicator()
                      : Row(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                        colors: [
                                      Colors.white,
                                      Colors.white.withOpacity(0.9),
                                      Colors.white.withOpacity(0.7),
                                      Colors.transparent
                                    ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)
                                    .createShader(bounds);
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: (weatherController
                                                  .weather.value?.main?.temp ??
                                              0.0)
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 90,
                                        color: Colors.white,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Transform.translate(
                                        offset: const Offset(0, -40),
                                        child: const Text(AppStrings.degree,
                                            style: TextStyle(
                                              fontSize: 50,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 150,
                ),
                // Temperature Metrics Row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => weatherController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: WeatherInfoIcon(
                                icon: Icons.cloud_rounded,
                                readings:
                                    '${weatherController.weather.value!.clouds!.all} %',
                                label: AppStrings.cloudiness,
                              ),
                            ),
                    ),
                    CustomVerticalDivider(),
                    Obx(
                      () => weatherController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: WeatherInfoIcon(
                                // icon: Icons.water_drop_rounded,
                                icon: FontAwesomeIcons.cloudRain,
                                readings:
                                    '${weatherController.weather.value!.main!.humidity} %',
                                label: AppStrings.humidity,
                              ),
                            ),
                    ),
                    CustomVerticalDivider(),
                    Obx(
                      () => weatherController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: WeatherInfoIcon(
                                icon: FontAwesomeIcons.wind,
                                readings:
                                    '${weatherController.weather.value!.wind!.speed} km/h',
                                label: AppStrings.wind,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Temperature Metrics Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => weatherController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: WeatherInfoIcon(
                                // icon: Icons.water_drop_rounded,
                                icon: FontAwesomeIcons.eyeLowVision,
                                readings:
                                    '${weatherController.weather.value!.visibility} m',
                                label: AppStrings.visibility,
                              ),
                            ),
                    ),
                    CustomVerticalDivider(),
                    Obx(
                      () => weatherController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Expanded(
                              child: WeatherInfoIcon(
                                icon: Icons.tire_repair_rounded,
                                readings:
                                    '${weatherController.weather.value!.main!.pressure}',
                                label: AppStrings.pressure,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // 7 day Forecast
                const BlurredBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        WeatherSummaryCard(
                          day: 'Today',
                          icon: FontAwesomeIcons.cloud,
                          minTemp: 20,
                          maxTemp: 25,
                        ),
                        WeatherSummaryCard(
                          day: 'Tomorrow',
                          icon: FontAwesomeIcons.cloud,
                          minTemp: 20,
                          maxTemp: 25,
                        ),
                        WeatherSummaryCard(
                          day: 'Today',
                          icon: FontAwesomeIcons.cloud,
                          minTemp: 20,
                          maxTemp: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
