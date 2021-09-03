import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function txHandler;

  NewTransaction({
    Key key,
    this.txHandler,
  }) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    widget.txHandler(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              /* onSubmitted: (_) => submitData(), */
            ),
            TextButton(
              onPressed: () {
                widget.txHandler(
                  titleController.text,
                  double.parse(amountController.text),
                );
                
                titleController.clear();
                amountController.clear();
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
