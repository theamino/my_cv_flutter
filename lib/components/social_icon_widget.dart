import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cv_project/bloc/icon_bloc.dart';
import 'package:my_cv_project/bloc/url_launch_bloc.dart';
import 'package:my_cv_project/bloc/url_launch_bloc/url_launch_event.dart';
import 'package:my_cv_project/model/social_url.dart';


class SocialIconWidget extends StatefulWidget {

  final String socialUrl;
  final String svgPicture;
  final double size;
  final Color color;


  SocialIconWidget({Key? key, required this.svgPicture,  required this.socialUrl, this.size = 20.0, this.color = Colors.grey}) : super(key: key);

  @override
  _SocialIconWidgetState createState() => _SocialIconWidgetState();
}

class _SocialIconWidgetState extends State<SocialIconWidget> {
  @override
  Widget build(BuildContext context) {

    SocialIconBloc socialIconBloc = SocialIconBloc();

    return BlocBuilder(builder: (bcontext, state) {
      return MouseRegion(
        child: GestureDetector(
          child: SvgPicture.asset(widget.svgPicture, color: state as Color, height: widget.size, width: widget.size,),
          onTap: () => context.read<UrlLaunchBloc>().add(NewTabOpenEvent(widget.socialUrl)),
        ),
        onExit: (event) => socialIconBloc.add(MouseOut()),
        onEnter: (event) => socialIconBloc.add(MouseIn()),
      );
    }, bloc: socialIconBloc,);
  }
}
