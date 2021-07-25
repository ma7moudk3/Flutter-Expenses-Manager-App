import 'package:expense_manager/view/screens/app_controller.dart';
import 'package:expense_manager/view/screens/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(428, 926),
    builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
      ),
      home: OnBoardingScreen(),
    ),
  ));
}
