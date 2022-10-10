// ignore_for_file: prefer_const_constructors

import 'package:expense_planner_app/models/Transactions.dart';
import 'package:flutter/material.dart';
import 'transaction_list_items.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;
  final Function deleteTx;

  TransactionList({required this.transaction, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              // ignore: prefer_const_literals_to_create_immutables
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.6,
                  child: Image(
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/nodata.png'),
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.1,
                  child: SizedBox(),
                ),
                Text(
                  'Please add some transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            );
          })
        :  ListView(children: [...transaction.map((index){
                return TransactionListItems(key: ValueKey(index.id),
                        transaction: index, deleteTx: deleteTx);
              }) ]
                  );
                }
              
            
        
  }

