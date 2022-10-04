// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:expense_planner_app/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var title;
    //var amount;

    final titleinput = TextEditingController();
    final amountinput = TextEditingController();

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
            Card(
                margin: EdgeInsets.all(5),
                elevation: 5,
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title',contentPadding: EdgeInsets.all(10)),
                    //onChanged: (text){
                    //title=text;1
                    controller: titleinput,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount',contentPadding: EdgeInsets.all(10)),
                    //onChanged: (text){
                    //amount=text;}
                    controller: amountinput,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              print(titleinput.text);
                              print(amountinput.text);
                            },
                            child: Text(
                              'Add new Transaction',
                              style: TextStyle(color: Colors.deepPurple),
                            )),
                      ],
                    ),
                  ),
                ])),
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
                              '\$${e.amount}',
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
                                DateFormat.yMMMEd().format(e.time),
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
