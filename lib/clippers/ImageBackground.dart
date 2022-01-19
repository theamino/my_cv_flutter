import 'package:flutter/material.dart';

class ImageBackground extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final Path path = Path();

    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height-35.0);
    path.lineTo(size.width/2, size.height);
    path.lineTo(size.width, size.height-35.0);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
