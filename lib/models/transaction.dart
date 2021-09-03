import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});

  Map<String, dynamic> toJson(){
  return {
    "id": this.id,
    "title": this.title,
    "amount": this.amount.toString(),
    "date": this.date
  };
}
}
