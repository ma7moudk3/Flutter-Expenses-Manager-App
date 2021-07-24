import 'package:expense_manager/constances/budgets_constanses.dart';
import 'package:expense_manager/constances/colors.dart';
import 'package:expense_manager/view/screens/create_budget_screen.dart';
import 'package:expense_manager/view/widgets/month_list_widget.dart';
import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int activeMonth = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: PrimaryText(
          'Budget',
          fontWeight: FontWeight.bold,
          alignment: Alignment.centerLeft,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateBudgetScreen()),
              );
            },
            icon: Icon(AntDesign.plus),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(AntDesign.search1),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          MonthListWidget(
            activeMonth: activeMonth,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: budget_json.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 150.h,
                        width: ScreenUtil().screenWidth - 40,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        margin: EdgeInsets.only(top: 15.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              budget_json[index]['name'],
                              fontSize: 18,
                              textColor: Colors.grey,
                              alignment: Alignment.centerLeft,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    PrimaryText(
                                      budget_json[index]['price'],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: PrimaryText(
                                          budget_json[index]
                                              ['label_percentage'],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          textColor: Color(0xff67727d)
                                              .withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    budget_json[index]['price'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color:
                                            Color(0xff67727d).withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                            Stack(children: [
                              Container(
                                margin: EdgeInsets.only(top: 25.h),
                                width: ScreenUtil().screenWidth,
                                height: 4.h,
                                decoration:
                                    BoxDecoration(color: grey.withOpacity(0.2)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25.h),
                                width: (ScreenUtil().screenWidth - 65) *
                                    budget_json[index]['percentage'],
                                height: 4.h,
                                decoration: BoxDecoration(
                                    color: budget_json[index]['color']),
                              ),
                            ])
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
