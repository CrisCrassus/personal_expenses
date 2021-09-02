import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(child: 
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'), 
                        controller: titleController,

                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'), 
                        controller: amountController
                        
                      ),
                      TextButton(child:Text('Add Transaction'), onPressed: () {
                        
                      },),
                    ],
                  ),
                ),
              );
  }
}