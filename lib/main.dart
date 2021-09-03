import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:personal_expenses/themes/themes.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: themes('frost'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 95.99,
      date: DateTime.now().subtract(Duration(days: 4),),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 32.78,
      date: DateTime.now().subtract(Duration(days: 2),),
    ),
    Transaction(
      id: 't3',
      title: 'New Phone',
      amount: 132.78,
      date: DateTime.now().subtract(Duration(days: 3),),
    )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    //call set state to update user list
    Navigator.pop(context);
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            String encode = jsonEncode(_userTransaction);
            print(encode);
          }, icon: Icon(Icons.save))
        ],
        title: Text(
          'Personal Expenses',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chart(recentTransactions: _recentTransactions),
              TransactionList(_userTransaction),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (bContext) {
              return NewTransaction(txHandler: _addNewTransaction);
            },
          );
        },
      ),
    );
  }
}
