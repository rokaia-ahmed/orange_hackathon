import 'package:flutter/material.dart';
import 'package:ms_widgets/ms_widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../layout/pages_layout.dart';
import 'colors.dart';
import 'constants.dart';

class ContactItemBuilder extends StatelessWidget {
  final TextStyle? textStyle;
  final double? spaceBetween;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final String? text;
  ContactItemBuilder({
    this.textStyle,
    this.spaceBetween,
    this.icon,
    this.text,
    this.iconColor,
    this.iconSize,
});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon,color:iconColor ,size: iconSize,),
        SizedBox(width: spaceBetween,),
        Text(
          text!,
          style: textStyle,
        ),
      ],
    );
  }
}

List<BoardingModel> boards = [
  BoardingModel(
    image: "assets/images/cat2.png",
    name: "Caty",
  ),
  BoardingModel(
    image: "assets/images/cat2.png",
    name: "Caty",
  ),
  BoardingModel(
    image: "assets/images/dog.png",
    name: "Caty",
  ),
];
class BoardingModel {
  final String image;
  final String name;

  BoardingModel({
    required this.name,
    required this.image,
  });
}


Widget buildBoardingItem(BoardingModel model) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBrown,width: 3)
    ),
    child: Column(
      children: [
        Image(width: 300, image: AssetImage('${model.image}')),
        Text(
          '${model.name}',
          style: TextStyle(
            color: kBrown,
            fontSize: 30,
          ),
        ),
        defaultButton(
          backgroundColor: Colors.transparent,
          function: () {},
          buttonHeight: 50,
          buttonWidth: 200,
          borderWidth: 2,
          text: 'Read more',
          textStyle: TextStyle(color: kBrown, fontSize: 20),
          borderRadius: BorderRadius.circular(20),
          borderColor: kBrown,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
        )
      ],
    ),
  );
}


class defaultIconButton extends StatelessWidget {
  final String? iconSvgPath;
  final String? buttomTitle;
  final Function? onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  defaultIconButton({
    required this.iconSvgPath,
    required this.buttomTitle,
    required this.onPressed,
    required this.backgroundColor,
    this.borderRadius,
    this.textStyle,
    this.width = 100,
    this.elevation = 1,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: MaterialButton(
          onPressed: onPressed!(),
          color: backgroundColor,
          elevation: elevation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                  height: 20,
                  width: 20,
                  color: kWhite,
                  child: SvgPicture.asset(iconSvgPath!)),
              Text(buttomTitle!,
                style: textStyle,
              ),
              // <-- Text

            ],
          )
      ),
    );
  }
}



Widget footerBuilder(){
  return Container(
    height: 280,
    width: double.maxFinite,
    decoration:  BoxDecoration(
      gradient: LinearGradient(
          colors: gradient
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'For any questions',
              style: const TextStyle(
                color: Color(0xFFFFE3C5),
                fontSize: 30,
              ),
            ),
            ContactItemBuilder(
              icon: Icons.email,
              spaceBetween: 10,
              text: 'Email@petology.com',
              iconColor: const Color(0xFFAE957B),
              textStyle: const TextStyle(color:Color(0xFFAE957B) ,fontSize: 20 ),
            ),
            ContactItemBuilder(
              icon: Icons.phone,
              spaceBetween: 10,
              text: '(+2)0123456789',
              iconColor: const Color(0xFFAE957B),
              textStyle: const TextStyle(color:const Color(0xFFAE957B) ,fontSize: 20 ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'We are waiting you',
              style: const TextStyle(
                color: Color(0xFFFFE3C5),
                fontSize: 30,
              ),
            ),
            ContactItemBuilder(
              icon: Icons.location_on_rounded,
              spaceBetween: 10,
              text: 'First settlement/Cairo',
              iconColor: const Color(0xFFAE957B),
              textStyle: const TextStyle(color:const Color(0xFFAE957B) ,fontSize: 20 ),
            ),
            ContactItemBuilder(
              icon: Icons.location_on_rounded,
              spaceBetween: 10,
              text: 'Cairo/Egypt',
              iconColor: const Color(0xFFAE957B),
              textStyle: const TextStyle(color:const Color(0xFFAE957B) ,fontSize: 20 ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/dog.png',
              width: 300,
            )
          ],
        ),
      ],
    ),
  );
}


void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}


void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
}