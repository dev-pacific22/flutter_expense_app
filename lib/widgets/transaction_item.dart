import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction userTransaction;
  final int index;
  final Function onDeleteTransactionPress;
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.index,
    @required this.onDeleteTransactionPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              border:
                  Border.all(width: 1, color: Theme.of(context).accentColor),
            ),
            child: Text(
              '\$ ${userTransaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userTransaction.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  DateFormat.yMMMEd().add_jm().format(userTransaction.date),
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                )
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onDeleteTransactionPress(index),
            color: Theme.of(context).errorColor,
          )
        ],
      ),
    );
  }
}
