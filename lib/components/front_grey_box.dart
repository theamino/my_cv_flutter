import 'package:flutter/material.dart';
import 'package:my_cv_project/bloc/language_bloc/language_bloc_event.dart';
import 'package:my_cv_project/bloc/language_bloc/language_bloc_state.dart';
import 'package:my_cv_project/bloc/url_launch_bloc.dart';
import 'package:my_cv_project/bloc/url_launch_bloc/url_launch_event.dart';
import 'package:my_cv_project/clippers/ImageBackground.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv_project/bloc/LanguageBloc.dart';
import 'package:my_cv_project/components/social_row.dart';
import 'package:my_cv_project/components/text_icon.dart';

import 'changer_image.dart';


class FrontGreyBox extends StatelessWidget {

  static  var title_white = Color(0xffe0e0e2);

  final Color card_background;
  final double height, width;
  BorderRadius? borderRadius;

  final String _placeholder = "place holder";

  FrontGreyBox({required this.height, required this.width, this.card_background = const Color(0xff31313a), this.borderRadius});


  @override
  Widget build(BuildContext context) {


    var col=  Column(
      children: <Widget>[
        ClipPath(
          clipper: ImageBackground(),
          child: Container(
              height: ((height + 80)/2)-45,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(5.0)),
                  image:  DecorationImage(image:  AssetImage('assets/images/header_background.jpg'),fit: BoxFit.fill)
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top:65.0),
          //  width: 200.0,

          child: Builder(
            builder: (context) {
              return Text((context.watch<LanguageBloc>().state as LanguageBlocState).person_name
                ,style: const TextStyle(color: Color(0xffe0e0e2), fontSize: 25.0, fontFamily: 'IranSans', fontWeight: FontWeight.w400, letterSpacing: 0.01),);
            },
          )

        ),
        Container(
            margin: const EdgeInsets.only(top:5.0),
            //  width: 200.0,
            child: Builder(
              builder: (context) {
                return Text((context.watch<LanguageBloc>().state as LanguageBlocState).field
                    ,style: const TextStyle(color: Colors.orange, fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'IranSans', letterSpacing: 0.0));
              },
            )
        ),
        SocialRow(),

        //divider
        Container(
          margin: const EdgeInsets.only(top: 35.0,left: 5.0),
          height: 0.5,
          width: MediaQuery.of(context).size.width,
          //color: Colors.white,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight,
                  colors: [card_background,title_white]
              )
          ),
        ),
        //bottom section
        Container(
          margin: const EdgeInsets.only(top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: InkWell(
                    child: TextIcon(text: (context.watch<LanguageBloc>().state).resume ,svg_img: 'assets/images/download.svg'),
                    onTap: (){
                      _launchURL(context, 'https://resume.theamino.ir/files/theaminoresume.pdf');

                    },
                  )
              ),
              Container(
                padding: const EdgeInsets.only(right: 60.0),

                child: InkWell(onTap: (){
                  _launchURL(context, 'https://t.me/amino6');

                },
                    child: TextIcon(text: (context.watch<LanguageBloc>().state).contact_me ,svg_img: 'assets/images/telegram.svg')),
              ),
            ],
          ),
        )

      ],
    );



    var circle_container_border = Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        color: card_background,
        borderRadius: BorderRadius.all(const Radius.circular(70.0)),

      ),
    );

    var circle_container_right = Container(
      width: 134.0,
      height: 134.0,
      decoration: BoxDecoration(
        color: Color(0xff26f27a27),
        borderRadius: BorderRadius.all(const Radius.circular(67.0)),

      ),
    );


    return Center(

        child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              color: card_background,
            ),
            height: height,
            width: width,

            child: Stack(
              children: <Widget>[
                col,
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Center(

                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 15.0,top: 10.0),
                          child: circle_container_right,
                        ),
                        circle_container_border,

                        Container(
                          margin: const EdgeInsets.all(3.0),
                          child: ChnagerImage(),
                        )
                      ],
                    )
                    ,

                  ),

                ) ],
            )

        )
    );
  }

  void _launchURL(BuildContext context, String url) {
    context.read<UrlLaunchBloc>().add(NewTabOpenEvent(url));
  }
}
