import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/overview_task_container.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    print('Building TransactionList');
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.black38,
                        ),
                        child: ClipRRect(
                          child: Center(child: Text('£${transactions[index].amount.toStringAsFixed(2)}', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(transactions[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20))
                    ],
                  ),
                  Row(children: [
                    Text(DateFormat.yMMMMd().format(transactions[index].date),
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            fontSize: 12)),
                    SizedBox(width: 20),
                    
                  ])
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
