import 'package:flutter/material.dart';

import '../extensions.dart';

class CircleButtonText extends StatelessWidget {
  final String text;
  final String? image;
  final Widget? imageWidget;
  final double? radius;
  final Color? color;

  const CircleButtonText(
    this.text, {
    super.key,
    this.image,
    this.imageWidget,
    this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color ?? Theme.of(context).primaryColor;

    ///In this scenario, Row is the appropriate choice for widget positioning.
    ///Align is not suitable due to limitations in RTL language cases.
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: radius! * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if ((image?.isNotEmpty ?? false) || imageWidget != null) ...[
                imageWidget ??
                    Image.asset(
                      image!,
                      width: 25,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(
                  color: backgroundColor.getColorBasedOnBackground,
                  fontSize: radius,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
