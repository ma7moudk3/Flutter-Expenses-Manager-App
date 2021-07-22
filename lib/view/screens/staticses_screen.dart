import 'package:expense_manager/constances/colors.dart';
import 'package:expense_manager/view/widgets/chart_widget.dart';
import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_manager/constances/daily_constanse.dart';

class StaticsesScreen extends StatefulWidget {
  @override
  _StaticsesScreenState createState() => _StaticsesScreenState();
}

class _StaticsesScreenState extends State<StaticsesScreen> {
  int activeMonth = 0;
  List expenses = [
    {
      "icon": Icons.arrow_back,
      "color": blue,
      "label": "Income",
      "cost": "\$6593.75"
    },
    {
      "icon": Icons.arrow_forward,
      "color": red,
      "label": "Expense",
      "cost": "\$2645.50"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: PrimaryText(
          'Staticses',
          fontWeight: FontWeight.bold,
          alignment: Alignment.centerLeft,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
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
                          activeMonth = index;
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
                                color: activeMonth == index
                                    ? primary
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: activeMonth == index
                                        ? primary
                                        : Color(0xFF090B1C).withOpacity(0.2))),
                            child: PrimaryText(
                              months[index]['day'],
                              textColor: activeMonth == index
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
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Container(
              width: double.infinity,
              height: 350.h,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Net balance",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Color(0xff67727d)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$2446.90",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: (ScreenUtil().screenWidth - 20),
                        height: 260.h,
                        child: LineChart(
                          mainData(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  width: (ScreenUtil().screenWidth - 60) / 2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: expenses[index]['color']),
                          child: Center(
                              child: Icon(
                            expenses[index]['icon'],
                            color: white,
                          )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              expenses[index]['cost'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
