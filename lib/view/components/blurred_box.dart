import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredBox extends StatelessWidget {
  final Widget child;
  // double? height = 100;
  // double? width = 100;

  const BlurredBox({
    super.key,
    required this.child,
    // this.width, this.height
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 3),
        child: Container(
          // height: height,
          // width: width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          color: Colors.black.withOpacity(0.2),
          child: child,
        ),
      ),
    );
  }
}
