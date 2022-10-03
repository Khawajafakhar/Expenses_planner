// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:expense_planner_app/Transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transactions> transaction = [
      Transactions(
          id: 01, amount: 79.99, time: DateTime.now(), title: 'T-shirt'),
      Transactions(
          id: 02, amount: 59.99, time: DateTime.now(), title: 'Shorts'),
      Transactions(
          id: 01, amount: 39.99, time: DateTime.now(), title: 'Underwear')
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
              
              child: Card(
              //  color: Colors.black,
                elevation: 100,
                
                child: Text(
                  'Container in the Column',
                  
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: transaction
                  .map((e) => Card(
                          child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: 2, color: Colors.deepPurple)),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            child: Text(
                              e.amount.toString(),
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                e.time.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      )))
                  .toList(),
            )
          ]),
    ));
  }
}
