import 'package:expense_manager/view/widgets/introScreenonBoarding.dart';
import 'package:expense_manager/view/widgets/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'introduction title 1',
      subTitle:
          "lorem Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs",
      imageUrl: 'images/intro3.png',
      imageHeight: ScreenUtil().screenHeight * 0.4,
      imageWidth: ScreenUtil().screenWidth * 0.7,
    ),
    Introduction(
      title: 'introduction title 2',
      subTitle:
          "lorem Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs",
      imageUrl: 'images/intro1.png',
      imageHeight: ScreenUtil().screenHeight * 0.4,
      imageWidth: ScreenUtil().screenWidth * 0.7,
    ),
    Introduction(
      title: 'introduction title 3',
      subTitle:
          "lorem Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs",
      imageUrl: 'images/intro2.png',
      imageHeight: ScreenUtil().screenHeight * 0.4,
      imageWidth: ScreenUtil().screenWidth * 0.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print("Height" + MediaQuery.of(context).size.height.toString());
    print("width" + MediaQuery.of(context).size.width.toString());
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AppController(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
