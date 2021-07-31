import 'package:expense_manager/helper/db_helper.dart';

class MyTransaction{
  String transactionName;
  String transactionDate;
  //int transactionID;
  double transactionValue;
  String transactionCategory;
  MyTransaction({this.transactionName,this.transactionDate,this.transactionValue,this.transactionCategory});


  MyTransaction.fromJson(Map map){
    this.transactionName = map[DBHelper.columnTransactionName];
    this.transactionDate = map[DBHelper.columnTransactionDate];
    this.transactionValue = map[DBHelper.columnTransactionValue];
    this.transactionCategory= map[DBHelper.columnTransactionCategory];
  }

  toJson(){
    return {
      DBHelper.columnTransactionName :this.transactionName,
      DBHelper.columnTransactionDate : this.transactionDate,
      DBHelper.columnTransactionValue : this.transactionValue,
      DBHelper.columnTransactionCategory : this.transactionCategory
    };
  }

}