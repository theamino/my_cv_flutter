import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ChnagerImage extends StatefulWidget {

  @override
  _ChangerImageState createState() => _ChangerImageState();
}

class _ChangerImageState extends State<ChnagerImage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500)
    );

    animation = Tween(begin: 1.0, end: 0.3).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {



    return MouseRegion(
      child: AnimatedBuilder(
        animation: controller,
        builder: myBuilder,
      ),
      onEnter: (e) => controller.forward(),
      onExit: (e) => controller.reverse(),
    );
  }

  Widget myBuilder(BuildContext context, Widget? child) {
    Widget myImage = Opacity(opacity: animation.value , child: Container(
      width: 134.0,
      height: 134.0,
      decoration: const BoxDecoration(
        image:  DecorationImage(
          image:  AssetImage('assets/images/me_big.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(67.0)),

      ),
    ),);

    Widget logoImage = Opacity(opacity: 1.0 - animation.value, child: Container(
      width: 134.0,
      height: 134.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(67.0)),

      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(67.0)),
            image:  DecorationImage(
              image:  AssetImage('assets/images/logo_512b.png',),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ));

    Widget myStack = Stack(
      children: [myImage, logoImage],
    );

    return myStack;
  }
}
