import './transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList({@required this.userTransactions, this.deleteTransaction});
  void _onDeleteTransactionPress(int index) {
    deleteTransaction(index);
  }

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No transaction added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                userTransaction: userTransactions[index],
                onDeleteTransactionPress: _onDeleteTransactionPress,
                index: index,
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
