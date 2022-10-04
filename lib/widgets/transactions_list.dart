// ignore_for_file: prefer_const_constructors

import 'package:expense_planner_app/models/Transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './user_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;

 TransactionList({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: transaction
            .map((e) => Card(
                    child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 2, color: Colors.deepPurple)),
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
      ),
    );
  }
}
