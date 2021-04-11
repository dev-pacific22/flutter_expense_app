import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      name: "New Shoes",
      amount: 107.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      name: "Groceries",
      amount: 129.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        name: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      print('${newTx.name}');
      _userTransactions.add(newTx);
    });
  }

  void _onAddButtonPress(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addTransaction: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddButtonPress(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 60,
              child: Card(
                color: Colors.orange,
                elevation: 5,
                child: Text(
                  'Chart!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            TransactionList(
              userTransactions: _userTransactions,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _onAddButtonPress(context);
        },
      ),
    );
  }
}
