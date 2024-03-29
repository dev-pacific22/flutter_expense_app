import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({@required this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    // widget and context objects are available with State class.
    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _onSelectDatePress() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime(2024),
    ).then((selectedDate) {
      if (selectedDate == null) {
        print('UserCancelled');
        return;
      }
      final formattedDate = DateFormat.yMd().format(selectedDate);
      _selectedDate = selectedDate;
      print(formattedDate);
      dateController.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
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
                onSubmitted: (_) => _submitData(),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      enabled: false,
                      decoration:
                          InputDecoration(labelText: 'No date selected'),
                      controller: dateController,
                    ),
                  ),
                  FlatButton(
                    onPressed: _onSelectDatePress,
                    child: Text(
                      'Select Date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.lime.shade300),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 16)),
                  ),
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _submitData)
            ],
          ),
        ),
      ),
    );
  }
}
