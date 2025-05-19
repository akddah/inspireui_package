import 'package:flutter/material.dart';

import '../extensions/color_extension.dart';

class MaterialTip extends StatelessWidget {
  final String? message;
  final Widget? child;

  const MaterialTip({
    super.key,
    this.message,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message!,
      padding: const EdgeInsets.all(10),
      showDuration: const Duration(seconds: 10),
      decoration: BoxDecoration(
        color: Colors.black.withValueOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: Colors.white54,
          width: 1,
        ),
      ),
      textStyle:
          Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
      preferBelow: true,
      verticalOffset: 20,
      child: child,
    );
  }
}
