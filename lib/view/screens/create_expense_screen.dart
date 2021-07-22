import 'package:expense_manager/constances/categories_constanse.dart';
import 'package:expense_manager/constances/colors.dart';
import 'package:expense_manager/constances/daily_constanse.dart';
import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateExpenseScreen extends StatefulWidget {
  @override
  _CreateExpenseScreenState createState() => _CreateExpenseScreenState();
}

class _CreateExpenseScreenState extends State<CreateExpenseScreen> {
  int activeCategory = 0;
  TextEditingController _budgetName =
      TextEditingController(text: "Grocery Budget");
  TextEditingController _budgetPrice = TextEditingController(text: "\$1500.00");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: PrimaryText(
            'Create Budget',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryText(
                'Choose Category',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textColor: grey,
                alignment: Alignment.centerLeft,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              height: 180.h,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCategory = index;
                      });
                    },
                    child: Container(
                        width: 150.w,
                        height: 60.h,
                        margin: EdgeInsets.only(left: 10, right: 5),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: activeCategory == index
                                ? Border.all(color: primary, width: 2.5)
                                : Border.all(color: Colors.transparent)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              categories[index]['icon'],
                              height: 50.h,
                              width: 50.w,
                            ),
                            PrimaryText(
                              categories[index]['name'],
                              fontWeight: FontWeight.bold,
                              alignment: Alignment.centerLeft,
                              fontSize: 22,
                              textColor:
                                  activeCategory == index ? primary : black,
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "budget name",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d)),
                  ),
                  TextField(
                    controller: _budgetName,
                    cursorColor: black,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        hintText: "Enter Budget Name",
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (ScreenUtil().screenWidth - 140),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter budget",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d)),
                            ),
                            TextField(
                              controller: _budgetPrice,
                              cursorColor: black,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                              decoration: InputDecoration(
                                  hintText: "Enter Budget",
                                  border: InputBorder.none),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
