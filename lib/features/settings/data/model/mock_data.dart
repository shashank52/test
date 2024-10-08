import 'package:news_app/features/settings/data/model/app_color_model.dart';

/// The `COLOR_LIST` constant is a Dart map that contains a list of color objects. Each color object has
/// two properties: `color_name` and `color_code`. The `color_name` property represents the name of the
/// color, while the `color_code` property is an object that contains the type and value of the color
/// code.
const COLOR_LIST = {
  "data": [
    {
      "color_name": "Red",
      "color_code": {"type": "hex", "value": "#DB374A"}
    },
    {
      "color_name": "Indigo",
      "color_code": {"type": "hex", "value": "#5556D9"}
    },
    {
      "color_name": "Purple",
      "color_code": {"type": "hex", "value": "#6200EE"}
    },
    {
      "color_name": "Blue",
      "color_code": {"type": "hex", "value": "#1366D9"}
    },
    {
      "color_name": "Light Blue",
      "color_code": {"type": "hex", "value": "#0A96D7"}
    },
    {
      "color_name": "Violet",
      "color_code": {"type": "hex", "value": "#9640D9"}
    },
    {
      "color_name": "Pink",
      "color_code": {"type": "hex", "value": "#D940AB"}
    },
    {
      "color_name": "Rose Pink",
      "color_code": {"type": "hex", "value": "#E0385F"}
    },
    {
      "color_name": "Orange",
      "color_code": {"type": "hex", "value": "#E45C12"}
    },
    {
      "color_name": "Light Orange",
      "color_code": {"type": "hex", "value": "#F79009"}
    },
    {
      "color_name": "Yellow",
      "color_code": {"type": "hex", "value": "#F7B409"}
    },
    {
      "color_name": "Light Yellow",
      "color_code": {"type": "hex", "value": "#EFCB15"}
    },
    {
      "color_name": "Light Green",
      "color_code": {"type": "hex", "value": "#ADD83A"}
    },
    {
      "color_name": "Green",
      "color_code": {"type": "hex", "value": "#78BB24"}
    },
    {
      "color_name": "Dark Green",
      "color_code": {"type": "hex", "value": "#1B8820"}
    },
    {
      "color_name": "Peacock Green",
      "color_code": {"type": "hex", "value": "#3D9A89"}
    },
  ]
};

/// The line `AppColorModel appColorModel = AppColorModel.fromMap(COLOR_LIST);` is creating an instance
/// of the `AppColorModel` class and initializing it with the data from the `COLOR_LIST` map. The
/// `fromMap` method of the `AppColorModel` class is used to convert the map data into an instance of
/// the `AppColorModel` class.
AppColorModel appColorModel = AppColorModel.fromMap(COLOR_LIST);
