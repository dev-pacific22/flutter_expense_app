import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList({@required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.purpleAccent),
                ),
                child: Text(
                  '\$ ${userTransactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userTransactions[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMEd()
                        .add_jm()
                        .format(userTransactions[index].date),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ],
              )
            ],
          ));
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
