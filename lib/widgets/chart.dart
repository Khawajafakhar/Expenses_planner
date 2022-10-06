import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transactions.dart';

class Chart extends StatelessWidget {
  final List<Transactions> _transactionslist;
  // const Chart({ Key? key }) : super(key: key);
  const Chart(this._transactionslist);
  List<Map<String, Object>> get groupedTransactionValues {
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

      return {'day': DateFormat.E().format(weekday), 'amout': totalsum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: []),
    );
  }
}
