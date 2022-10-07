// ignore_for_file: prefer_const_constructors

import 'package:expense_planner_app/models/Transactions.dart';
import 'package:expense_planner_app/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;
  final Function deleteTx;

  TransactionList({required this.transaction, required this.deleteTx});

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
            height: 520,
            child: Card(
              elevation: 6,
              child: ListView.builder(
                itemBuilder: (ctx, indx) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      elevation: 6,
                      child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.all(4),
                          child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 30,
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: FittedBox(
                                      child: Text(
                                    '\$${transaction[indx].amount.toStringAsFixed(2)}',
                                    style: TextStyle(color: Colors.white),
                                  )))),
                        ),
                        title: Text(
                          transaction[indx].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMEd().format(transaction[indx].time),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () => deleteTx(transaction[indx].id),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: transaction.length,
              ),
            ),
          );
  }
}
