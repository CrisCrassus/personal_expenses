import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  const TransactionItem({
    Key key, this.tx
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
                vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                '£' + tx.amount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tx.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                DateFormat.yMMMMd().format(tx.date),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
