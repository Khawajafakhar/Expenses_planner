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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Container(
                    height: constraints.maxHeight * 0.15,
                    child: FittedBox(
                        child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
                Container(
                  height: constraints.maxHeight * 0.05,
                  child: const SizedBox(),
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  width: 10,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(220, 220, 220, 1)),
                    ),
                    FractionallySizedBox(
                      heightFactor: spendingPercentage,
                      child: Container(
                          decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColor,
                      )),
                    )
                  ]),
                ),
                Container(
                  height: constraints.maxHeight * 0.05,
                  child: const SizedBox(),
                ),
                Container(
                    height: constraints.maxHeight * 0.15,
                    child: FittedBox(child: Text(label)))
              ],
            );
          },
        ));
  }
}
