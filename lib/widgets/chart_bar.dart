import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lableDay;
  final double amount;
  final double amountPercentage;

  const ChartBar({this.lableDay, this.amount, this.amountPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
            child: Text(
          '\$${this.amount.toStringAsFixed(2)}',
        )),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: amountPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text('${this.lableDay}'),
      ],
    );
  }
}
