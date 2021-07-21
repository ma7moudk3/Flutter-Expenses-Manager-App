import 'package:expense_manager/view/screens/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(428, 926),
    builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppController(),
    ),
  ));
}
