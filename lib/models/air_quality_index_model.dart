// To parse this JSON data, do
//
//     final airQualityIndexModel = airQualityIndexModelFromJson(jsonString);
// here the method is expecting a jsonString, in case of a map as input
// weatherModelFromJson(json.encode(jsonString));

import 'dart:convert';

AirQualityIndexModel airQualityIndexModelFromJson(String str) =>
    AirQualityIndexModel.fromJson(json.decode(str));

String airQualityIndexModelToJson(AirQualityIndexModel data) =>
    json.encode(data.toJson());

class AirQualityIndexModel {
  Coord coord;
  List<ListElement> list;

  AirQualityIndexModel({
    required this.coord,
    required this.list,
  });

  factory AirQualityIndexModel.fromJson(Map<String, dynamic> json) =>
      AirQualityIndexModel(
        coord: Coord.fromJson(json["coord"]),
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Coord {
  int lon;
  int lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class ListElement {
  Main main;
  Map<String, double> components;
  int dt;

  ListElement({
    required this.main,
    required this.components,
    required this.dt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        main: Main.fromJson(json["main"]),
        components: Map.from(json["components"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        dt: json["dt"],
      );

  Map<String, dynamic> toJson() => {
        "main": main.toJson(),
        "components":
            Map.from(components).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dt": dt,
      };
}

class Main {
  int aqi;

  Main({
    required this.aqi,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        aqi: json["aqi"],
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
      };
}
