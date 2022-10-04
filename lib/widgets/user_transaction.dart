
import 'package:expense_planner_app/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/Transactions.dart';
import './transactions_list.dart';
import 'New_transaction.dart';

class UserTransaction extends StatefulWidget {
  //var title;
  // var amount;
 const UserTransaction({ Key? key }) : super(key: key);
// UserTransaction({this.amount,this.title});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
 final List<Transactions> _transaction = [
    Transactions(id: DateTime.now(), amount: 79.99, time: DateTime.now(), title: 'T-shirt'),
    Transactions(id: DateTime.now(), amount: 59.99, time: DateTime.now(), title: 'Shorts'),
    Transactions(
        id: DateTime.now(), amount: 39.99, time: DateTime.now(), title: 'Underwear')
  ];
void addTransaction(String title,double amount){
  final newtx=Transactions(id: DateTime.now(), amount: amount, time: DateTime.now(), title: title);
 // TransactionList(transaction: _transaction);
 setState(() {
   _transaction.add(newtx);
 });
}


  @override
  Widget build(BuildContext context) {
    return Column(children: [NewTransactions(addTransaction),TransactionList(transaction: _transaction)],);
  }
}