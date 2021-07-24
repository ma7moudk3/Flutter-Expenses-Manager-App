import 'package:expense_manager/constances/colors.dart';
import 'package:expense_manager/constances/daily_constanse.dart';
import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthListWidget extends StatefulWidget {
  int activeMonth;

  MonthListWidget({this.activeMonth = 0});
  @override
  _MonthListWidgetState createState() => _MonthListWidgetState();
}

class _MonthListWidgetState extends State<MonthListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.h,
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Row(
          children: List.generate(
            months.length,
            (index) => Container(
              width: ScreenUtil().screenWidth / months.length,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.activeMonth = index;
                  });
                },
                child: Column(
                  children: [
                    PrimaryText(
                      months[index]['label'],
                      fontSize: 14,
                      textColor: Color(0xFF0B0E1D).withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 60.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          color: widget.activeMonth == index
                              ? primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: widget.activeMonth == index
                                  ? primary
                                  : Color(0xFF090B1C).withOpacity(0.2))),
                      child: PrimaryText(
                        months[index]['day'],
                        textColor: widget.activeMonth == index
                            ? Colors.white
                            : Color(0xFF090B1C),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
