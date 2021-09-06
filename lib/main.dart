import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/themes/themes.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); */
  runApp(MyApp());
}

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
  bool _showChart = false;

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 95.99,
      date: DateTime.now().subtract(
        Duration(days: 4),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 32.78,
      date: DateTime.now().subtract(
        Duration(days: 2),
      ),
    ),
    Transaction(
      id: 't3',
      title: 'New Phone',
      amount: 132.78,
      date: DateTime.now().subtract(
        Duration(days: 3),
      ),
    )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: date,
    );

    //call set state to update user list
    Navigator.pop(context);
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS ? CupertinoNavigationBar() : AppBar(
      actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (bContext) {
                  return NewTransaction(txHandler: _addNewTransaction);
                },
              );
            },
            icon: Icon(Icons.add))
      ],
      title: Text(
        'Personal Expenses',
      ),
    );

    final chart = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.8,
      child: Chart(recentTransactions: _recentTransactions),
    );
    final txList = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.6,
      child: TransactionList(_userTransaction, _deleteTransaction),
    );

    final body = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (isLandscape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Show Chart'),
                        Switch(
                          value: _showChart,
                          onChanged: (val) {
                            setState(() {
                              _showChart = !_showChart;
                            });
                          },
                        ),
                      ],
                    ),
                  if (!isLandscape)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.3,
                        child: Chart(recentTransactions: _recentTransactions),
                      ),
                    ),
                  if (!isLandscape)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: txList,
                    ),
                  if (isLandscape) _showChart ? chart : txList
                ],
              ),
            );
    return Platform.isIOS
        ? CupertinoPageScaffold(

        )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            body: body,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (bContext) {
                          return NewTransaction(
                            txHandler: _addNewTransaction,
                          );
                        },
                      );
                    },
                  ),
          );
  }
}
