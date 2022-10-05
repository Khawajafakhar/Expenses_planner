// ignore_for_file: prefer_const_constructors

import 'package:expense_planner_app/models/Transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;

  TransactionList({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            // ignore: prefer_const_literals_to_create_immutables
            // crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Image(
                  alignment: Alignment.center,
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/nodata.png'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Please add some transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          )
        : Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (ctx, indx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor)),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        '\$${transaction[indx].amount.toStringAsFixed(2)}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction[indx].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat.yMMMEd().format(transaction[indx].time),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ));
              },
              itemCount: transaction.length,
            ),
          );
  }
}
