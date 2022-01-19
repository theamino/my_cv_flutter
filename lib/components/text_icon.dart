import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cv_project/bloc/icon_bloc.dart';

class TextIcon extends StatelessWidget {

  final double icon_size;
  final double space;
  final String svg_img;
  final String text;


  TextIcon({this.icon_size = 25.0, this.space = 8.0, required this.svg_img, required this.text});

  @override
  Widget build(BuildContext context) {

    final bloc = SocialIconBloc();

    return BlocBuilder(builder: (context, state) {
      return MouseRegion(
        child: Row (
          children: [
            SvgPicture.asset(svg_img, width: icon_size, height: icon_size,),
            SizedBox(width: space,),
            Text(text, style: TextStyle(fontSize: 15, fontFamily: 'IranSans', color: state as Color, fontWeight: FontWeight.w700, ),)
          ],
        ),
        onEnter: (_) => bloc.add(MouseIn()),
        onExit: (_) => bloc.add(MouseOut()),
      );
    },bloc: bloc,);
  }
}
