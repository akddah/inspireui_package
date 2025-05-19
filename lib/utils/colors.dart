import 'package:flutter/material.dart';

import '../extensions.dart';
import 'logs.dart';

class MyHexColor extends Color {
  static final myLogger = LoggerDebug(constTitle: 'HexColor in inspire_ui');
  static int _getColorFromHex(dynamic hexColor) {
    try {
      if (hexColor is String) {
        hexColor = hexColor.toUpperCase().replaceAll('#', '');
        if (hexColor.length == 6) {
          hexColor = 'FF$hexColor';
        }

        if (hexColor.isNotEmpty) {
          return int.parse(hexColor, radix: 16);
        }
      }
      return int.parse('FFFFFFFF', radix: 16);
    } catch (e, trace) {
      myLogger.red(e.toString());
      myLogger.red(trace.toString());
      return int.parse('FFFFFFFF', radix: 16);
    }
  }

  MyHexColor(final hexColor) : super(_getColorFromHex(hexColor));

  factory MyHexColor.fromJson(dynamic json) => MyHexColor(json);

  static List<MyHexColor>? fromListJson(List listJson) {
    try {
      final listColor = listJson.map((e) {
        // ignore: avoid_as
        return MyHexColor.fromJson(e as String);
        // ignore: avoid_as
      }).toList();

      // ignore: avoid_as
      return listColor;
    } catch (e, trace) {
      myLogger.red('$e');
      myLogger.red('$trace');
      return [];
    }
  }

  String toJson() => valueNum.toRadixString(16);
}
