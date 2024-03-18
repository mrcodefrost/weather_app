import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double? height = 80;
  final double? thickness = 2;
  final Color? color = Colors.white.withOpacity(0.5);
  final EdgeInsetsGeometry? margin = const EdgeInsets.symmetric(horizontal: 10);

  CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      color: color,
      width: thickness,
    );
  }
}
