import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(
      {Key key, this.label, this.spendingAmount, this.spendingPctOfTotal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('£${spendingAmount.toStringAsFixed(0)}'),
          SizedBox(height: 4),
          Container(
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            height: 60,
            width: 10,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            label,
          ),
          SizedBox(width: 50)
        ],
      ),
    );
  }
}
