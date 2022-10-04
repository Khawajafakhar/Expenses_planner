// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:expense_planner_app/widgets/new_transaction.dart';
import 'package:expense_planner_app/widgets/transactions_list.dart';
import 'package:expense_planner_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var title;
    //var amount;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Expense Planner App'),
            actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))]),
        body: SingleChildScrollView(
          child: Column(
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
                UserTransaction()
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(onPressed: () {
          
        },child: Icon(Icons.add)),
      ),
    );
  }
}
