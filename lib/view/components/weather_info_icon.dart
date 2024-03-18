import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro_widgets/view/components/blurred_box.dart';

class WeatherInfoIcon extends StatelessWidget {
  final IconData icon;
  final String readings;
  final String label;

  const WeatherInfoIcon({
    super.key,
    required this.icon,
    required this.readings,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return BlurredBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 17,
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
              indent: 10,
              endIndent: 10,
            ),
            Text(
              readings,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
