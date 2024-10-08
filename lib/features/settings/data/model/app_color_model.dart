import 'dart:convert';

import 'package:flutter/material.dart';

AppColorModel appColorModelFromMap(String str) =>
    AppColorModel.fromMap(json.decode(str));

String appColorModelToMap(AppColorModel data) => json.encode(data.toMap());

class AppColorModel {
  final List<AppColor> data;

  AppColorModel({
    required this.data,
  });

  AppColorModel copyWith({
    List<AppColor>? data,
  }) =>
      AppColorModel(
        data: data ?? this.data,
      );

  factory AppColorModel.fromMap(Map<String, dynamic> json) => AppColorModel(
        data: List<AppColor>.from(json["data"].map((x) => AppColor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class AppColor {
  final String colorName;
  final ColorCode colorCode;

  AppColor({
    required this.colorName,
    required this.colorCode,
  });

  AppColor copyWith({
    String? colorName,
    ColorCode? colorCode,
  }) =>
      AppColor(
        colorName: colorName ?? this.colorName,
        colorCode: colorCode ?? this.colorCode,
      );

  factory AppColor.fromMap(Map<String, dynamic> json) => AppColor(
        colorName: json["color_name"],
        colorCode: ColorCode.fromMap(json["color_code"]),
      );

  Map<String, dynamic> toMap() => {
        "color_name": colorName,
        "color_code": colorCode.toMap(),
      };
}

class ColorCode {
  final String type;
  final String value;

  ColorCode({
    required this.type,
    required this.value,
  });

  Color get materialColor =>  Color(int.parse(value.replaceAll('#', '0xFF')));

  ColorCode copyWith({
    String? type,
    String? value,
  }) =>
      ColorCode(
        type: type ?? this.type,
        value: value ?? this.value,
      );

  factory ColorCode.fromMap(Map<String, dynamic> json) => ColorCode(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "value": value,
      };
}