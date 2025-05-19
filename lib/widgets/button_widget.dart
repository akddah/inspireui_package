import 'package:flutter/material.dart';

class ButtonWidget extends TextButton {
  ButtonWidget.primary(
    BuildContext context, {
    super.key,
    required String title,
    Function? onPressed,
    Color? disabledColor,
    Color? color,
    EdgeInsetsGeometry? padding,
  }) : super(
          onPressed: onPressed as void Function()?,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: padding ?? const EdgeInsets.all(12),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        );
}
