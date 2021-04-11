import 'dart:ffi';

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({@required this.addTransaction});

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.deepOrange),
                ),
                onPressed: submitData)
          ],
        ),
      ),
    );
  }
}
