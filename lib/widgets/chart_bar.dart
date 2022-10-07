import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;
  // const ChartBar({ Key? key }) : super(key: key);
  ChartBar(@required this.label, @required this.spendingAmount,
      @required this.spendingPercentage);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          Container(height: 20,child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                )),
              )
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(label)
        ],
      ),
    );
  }
}
