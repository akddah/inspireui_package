import 'package:flutter/material.dart';

const ColorFilter _greyscale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0.2126, 0.7152, 0.0722, 0, 0, //
  0, 0, 0, 1, 0, //
]);

/// This widget can be used to disable the widget and/or show a color filter
class DisableWidget extends StatelessWidget {
  final Widget child;
  final bool disable;

  /// Custom color filter instead of the default grey filter
  final ColorFilter _colorFilter;

  /// `false` if just want to ingore pointer event, but not filter color
  final bool _showColorFilter;

  const DisableWidget({
    super.key,
    required this.child,
    required this.disable,
    ColorFilter? colorFilter,
    bool? showColorFilter,
  })  : _showColorFilter = showColorFilter ?? disable,
        _colorFilter = colorFilter ?? _greyscale;

  @override
  Widget build(BuildContext context) {
    var widget = child;

    if (_showColorFilter) {
      widget = ColorFiltered(
        colorFilter: _colorFilter,
        child: child,
      );
    }

    if (disable) {
      return IgnorePointer(
        ignoring: disable,
        child: widget,
      );
    }

    return widget;
  }
}
