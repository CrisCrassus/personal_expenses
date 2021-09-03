import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function txHandler;

  NewTransaction({Key key, this.txHandler}) : super(key: key);

  void submitData() {

    txHandler(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('------> Building NewTransaction');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: () {
                submitData();
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
