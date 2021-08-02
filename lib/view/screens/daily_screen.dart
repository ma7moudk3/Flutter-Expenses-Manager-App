import 'package:expense_manager/constances/colors.dart';
import 'package:expense_manager/constances/daily_constanse.dart';
import 'package:expense_manager/helper/db_helper.dart';
import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DailyScreen extends StatefulWidget {
  @override
  _DailyScreenState createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  int activeDay = 0;
  @override
  Widget build(BuildContext context) {
    var weekDays = getLastWeek();

    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: PrimaryText(
          'Daily Transaction',
          fontWeight: FontWeight.bold,
          alignment: Alignment.centerLeft,
          fontSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(AntDesign.search1),
            color: Colors.black,
          )
        ],
      ),
      //  backgroundColor: Color(0xFFFCFCFC),
      body: Column(
        children: [
          Container(
              height: 120.h,
              padding: EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Row(
                children: List.generate(
                  weekDays.length,
                  (index) => Container(
                    width: ScreenUtil().screenWidth / weekDays.length,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeDay = index;
                        });
                      },
                      child: Column(
                        children: [
                          PrimaryText(
                            DateFormat('EE').format(weekDays[index]).toString(),
                            fontSize: 14,
                            textColor: Color(0xFF0B0E1D).withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 38.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                                color: activeDay == index
                                    ? primary
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: activeDay == index
                                        ? primary
                                        : Color(0xFF090B1C).withOpacity(0.2))),
                            child: PrimaryText(
                              weekDays[index].day.toString(),
                              textColor: activeDay == index
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
          Flexible(
            flex: 6,
            child: FutureBuilder(
              future: DBHelper.dbHelper.getAllTransactions(),
              builder: (context, snapshot) => ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (ScreenUtil().screenWidth - 40) * 0.7,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        daily[index]['icon'],
                                        width: 35.w,
                                        height: 35.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    width:
                                        (ScreenUtil().screenWidth - 90) * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data[index].transactionName,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: black,
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          snapshot.data[index].transactionDate,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (ScreenUtil().screenWidth - 40) * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${snapshot.data[index].transactionValue} \$",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 65, top: 8),
                          child: Divider(
                            thickness: 0.8,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 16,
                            color: black.withOpacity(0.4),
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "\$1780.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: black,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DateTime> getLastWeek() {
    List<DateTime> weekDays = [];
    for (var i = 6; i >= 0; i--) {
      var day = DateTime.now().subtract(Duration(days: i));
      print(day);
      weekDays.add(day);
    }
    return weekDays;
  }
}
