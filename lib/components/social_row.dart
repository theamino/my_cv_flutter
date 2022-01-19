import 'package:flutter/material.dart';
import 'package:my_cv_project/components/social_icon_widget.dart';


class SocialRow extends StatelessWidget {
  const SocialRow({Key? key, this.sized_box_width = 15.0}) : super(key: key);
  final sized_box_width;


  @override
  Widget build(BuildContext context) {

    var row_social = Container(
      margin: const EdgeInsets.only(top: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialIconWidget(socialUrl: "https://github.com/theamino", svgPicture: 'assets/images/github.svg',),
          SizedBox(width: sized_box_width,),
          SocialIconWidget(socialUrl: "https://instagram.com/theamino6?utm_medium=copy_link", svgPicture: 'assets/images/instagram.svg'),
          SizedBox(width: sized_box_width,),
          SocialIconWidget(socialUrl: "https://www.linkedin.com/in/mohammad-amin-aghababaei-beni-b71260144/", svgPicture: 'assets/images/linkedin.svg')

        ],
      ),
    );

    return row_social;
  }
}

