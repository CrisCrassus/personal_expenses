import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  /* final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 95.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 32.78,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Phone',
      amount: 132.78,
      date: DateTime.now(),
    )
  ]; */

  /* void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    //call set state to update user list

    setState(() {
      _userTransaction.add(newTx);
    });
  } */

  @override
  Widget build(BuildContext context) {
    print('Building UserTransaction');
    return Column(
      children: [
        /* NewTransaction(txHandler: _addNewTransaction),
        TransactionList(_userTransaction), */
      ],
    );
  }
}
