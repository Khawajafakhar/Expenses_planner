import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transactions.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transactions> _transactionslist;
  // const Chart({ Key? key }) : super(key: key);
  const Chart(this._transactionslist);
  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;
      for (int i = 0; i < _transactionslist.length; i++) {
        if (_transactionslist[i].time.day == weekday.day &&
            _transactionslist[i].time.month == weekday.month &&
            _transactionslist[i].time.year == weekday.year) {
          totalsum += _transactionslist[i].amount;
        }
      }
      //My print is not showing anything in concole
      // print(DateFormat.E().format(weekday).toString());
      // print(totalsum);

      return {
        'day': DateFormat.E().format(weekday).substring(0, 3),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get weeklySpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue += (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map<Widget>((e) {
              return ChartBar(
                  e['day'], e['amount'],weeklySpending==0.0?0.0: e['amount'] / weeklySpending);
            }).toList()),
      ),
    );
  }
}
