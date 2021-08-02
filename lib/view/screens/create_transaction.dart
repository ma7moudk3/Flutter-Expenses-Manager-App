import 'dart:ffi';

import 'package:expense_manager/constances/categories_constanse.dart';
import 'package:expense_manager/constances/colors.dart';
import 'package:expense_manager/helper/db_helper.dart';
import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/view/widgets/custom_text_field.dart';
import 'package:expense_manager/view/widgets/primaryText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'create_budget_screen.dart';

class NewTransactionScreen extends StatefulWidget {
  @override
  _NewTransactionScreenState createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  int activeCategory = 0;
  TextEditingController _transactionNameController = TextEditingController();
  TextEditingController _transactionValueController = TextEditingController();
  TextEditingController _transactionDateController = TextEditingController();
  String transactionName;
  String transactionDate;
  double transactionValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: PrimaryText(
          'New Transaction',
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
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
                    CustomTextField(
                      controller: _transactionNameController,
                      title: 'Transaction name',
                      hint: 'Enter Tranaction name',
                      onSaved: (value) {
                        transactionName = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        controller: _transactionDateController,
                        title: 'date of transaction',
                        hint: 'Enter date',
                        onSaved: (value) {
                          transactionDate = value;
                        },
                        onTap: () {
                          _showDatePicker(context);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (ScreenUtil().screenWidth - 140),
                          child: CustomTextField(
                            controller: _transactionValueController,
                            title: 'Budget value',
                            hint: 'Enter Budget',
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              transactionValue = double.parse(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Added Successfully')),
                              );
                              print(transactionName);
                              print(transactionDate);
                              print(transactionValue);
                              DBHelper.dbHelper.insertTransaction(MyTransaction(
                                  transactionName: transactionName,
                                  transactionDate: transactionDate,
                                  transactionCategory: "Auto",
                                  transactionValue: transactionValue));
                              List<MyTransaction> transactions =
                                  await DBHelper.dbHelper.getAllTransactions();
                              print(transactions[0].transactionName);
                            }
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DateTime _chosenDateTime = DateTime.now();
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                          });
                        }),
                  ),
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(_chosenDateTime);
                      _transactionDateController.text = formattedDate;
                      print(_transactionDateController.text);

                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ),
            ));
  }
}
