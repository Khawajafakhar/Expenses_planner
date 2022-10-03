import 'package:expense_planner_app/Transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
     List<Transactions> transaction = [
    Transactions(
        id: 01, amount: 79.99, time: DateTime.now(), title: 'new T-shirt'),
        Transactions(
        id: 02, amount: 59.99, time: DateTime.now(), title: 'new shorts'),
        Transactions(
        id: 01, amount: 39.99, time: DateTime.now(), title: 'new underwear')
  ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Expense Planner App')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              // height: 100,
              color: Colors.amberAccent,
              alignment: Alignment.centerLeft,
              // ignore: prefer_const_constructors
              child: Card(
                color: Colors.black,
                elevation: 100,
                // ignore: prefer_const_constructors
                child: Text(
                  'Container in the Column',
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 25,
            ),
            Column(children: transaction.map((e) => Row(
              children: [
                Card(child: Text(e.amount.toString())),
                Column(
                  children: [
                    Card(child: Text(e.title)),
                    Card(child: Text(e.time.toString())),
                  ],
                ),
              ],
            )).toList(),)
            
         ] ),
    ));
  }
}
