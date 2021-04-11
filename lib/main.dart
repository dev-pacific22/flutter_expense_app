import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  void onAddButtonPress() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: onAddButtonPress)
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
            UserTransactions(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddButtonPress,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
