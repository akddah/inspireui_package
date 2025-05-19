import 'package:flutter/widgets.dart';

extension ColorExtension on Color {
  /// This helps get color for text based on background
  Color get getColorBasedOnBackground {
    var d = 0;

    var luminance = 0.299 * r + 0.587 * g + 0.114 * b;

    // The luminance value = 0.5 will take the neutral brightness as the
    // boundary for dark and light. Because currently we need to set the
    // boundary leaning towards higher brightness, the set value is 0.65. That
    // means when the input color has a brightness value that must reach 0.65 or
    // higher then the result will be dark. Otherwise, the result will be light
    if (luminance > 0.65) {
      d = 0;
    } else {
      d = 255;
    }

    return Color.fromRGBO(d, d, d, 1);
  }

  /// A 32 bit value representing this color.
  ///
  /// The bits are assigned as follows:
  ///
  /// * Bits 24-31 are the alpha value.
  /// * Bits 16-23 are the red value.
  /// * Bits 8-15 are the green value.
  /// * Bits 0-7 are the blue value.
  int get valueNum {
    return _floatToInt8(a) << 24 |
        _floatToInt8(r) << 16 |
        _floatToInt8(g) << 8 |
        _floatToInt8(b) << 0;
  }

  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  bool isEqualTo(Color? other) {
    return other != null && valueNum == other.valueNum;
  }

  Color withValueOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }

  String toColorText() {
    return valueNum.toRadixString(16);
  }
}
