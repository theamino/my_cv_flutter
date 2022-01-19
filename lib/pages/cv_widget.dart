import 'package:flutter/material.dart';
import 'package:my_cv_project/bloc/LanguageBloc.dart';
import 'package:my_cv_project/bloc/language_bloc/language_bloc_event.dart';
import 'package:my_cv_project/bloc/language_bloc/language_bloc_state.dart';
import 'package:my_cv_project/components/front_grey_box.dart';
import 'package:my_cv_project/components/grey_empty_box.dart';
import 'package:my_cv_project/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv_project/bloc/LanguageBloc.dart';

class CVWidget extends StatelessWidget {

  static const _icon_size = 20;
  static const _sized_box_width = 20;




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(IMG_GREY_BG)
              , fit: BoxFit.cover
          )
      ),
      child: Builder(
        builder: (buildContext) {
          return Stack(
            alignment: Alignment.bottomCenter,
              children: [
                GreyEmptyBox(height: size.height - 80, width: 480.0),
                FrontGreyBox(height: size.height - 80, width: 480.0),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {buildContext.read<LanguageBloc>().add(LanguageChange(currentLanguage: Language.en));}
                          , child: Text("English", style: TextStyle(color: buildContext.watch<LanguageBloc>().state is EnglishState ? Colors.orange :  Colors.white),)),
                      const VerticalDivider(width: 2, color: Colors.white30,),
                      TextButton(onPressed: () {buildContext.read<LanguageBloc>().add(LanguageChange(currentLanguage: Language.fa));}
                          , child: Text("فارسی", style: TextStyle(color: buildContext.watch<LanguageBloc>().state is FarsiState ? Colors.orange :  Colors.white),)),
                    ],
                  ),
                ),

              ]
          );
        },
      ),
    );
  }
}
