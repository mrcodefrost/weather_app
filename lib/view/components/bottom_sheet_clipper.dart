import 'package:flutter/material.dart';

class BottomSheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // final path = Path();
    // path.lineTo(0, size.height - 50);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height - 50);
    // path.lineTo(size.width, 0);
    // path.close();

    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
