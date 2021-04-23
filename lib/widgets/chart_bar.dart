import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lableDay;
  final double amount;
  final double amountPercentage;

  const ChartBar({this.lableDay, this.amount, this.amountPercentage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constriants) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: constriants.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              '\$${this.amount.toStringAsFixed(0)}',
            )),
          ),
          SizedBox(
            height: constriants.maxHeight * 0.05,
          ),
          Container(
            height: constriants.maxHeight * 0.5,
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
            height: constriants.maxHeight * 0.05,
          ),
          Container(
            height: constriants.maxHeight * 0.15,
            child: FittedBox(
              child: Text('${this.lableDay}'),
            ),
          ),
        ],
      );
    });
  }
}
