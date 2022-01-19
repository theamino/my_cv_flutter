import 'package:flutter/material.dart';


class GreyEmptyBox extends StatelessWidget {

  final double height, width;
  Color color;
  EdgeInsets margin;
  BorderRadius? borderRadius;

  GreyEmptyBox({required this.height, required this.width, this.color = const Color(0xff242429)
    , this.margin = const EdgeInsets.only(left: 30.0,bottom: 20.0), this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(5.0),
          color: color,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
