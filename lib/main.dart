// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:expense_planner_app/widgets/chart.dart';
import 'package:expense_planner_app/widgets/new_transaction.dart';
import 'package:expense_planner_app/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/Transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  const MyApp({Key? key}) : super(key: key);
  final List<Transactions> _transaction = [
    // Transactions(
    //     id: DateTime.now(),
    //     amount: 79.99,
    //     time: DateTime.now(),
    //     title: 'T-shirt'),
    // Transactions(
    //     id: DateTime.now(),
    //     amount: 59.99,
    //     time: DateTime.now(),
    //     title: 'Shorts'),
    // Transactions(
    //     id: DateTime.now(),
    //     amount: 39.99,
    //     time: DateTime.now(),
    //     title: 'Underwear')
  ];
  List<Transactions> get _recentTransactions{
    return _transaction.where((tx) {
    return tx.time.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newtx = Transactions(
        id: DateTime.now(), amount: amount, time: date, title: title);
    // TransactionList(transaction: _transaction);
    setState(() {
      _transaction.add(newtx);
    });
  }

  void startAddOperation(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return NewTransactions(_addTransaction);
        });
  }

void deleteTransaction(var id){
    setState((){_transaction.removeWhere((element) => element.id==id);});
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.white 
                
                 // fontSize: 10,
                  
                  ),headline1: TextStyle(color: Colors.black)),
          brightness: Brightness.light,
          primarySwatch: Colors.cyan,
          errorColor: Color.fromRGBO(220, 220, 220, 1),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              elevation: 10, backgroundColor: Color.fromRGBO(139, 0, 139, 1)),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Expense Planner App'), actions: [
            IconButton(
                onPressed: () {
                  return startAddOperation(context);
                },
                icon: Icon(Icons.add,color: Colors.white,),)
          ]),
          body: Column(
            children: [ Chart(_recentTransactions),
              TransactionList(transaction:_transaction,deleteTx: deleteTransaction ),
            ],
          ), 
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                return startAddOperation(context);
              },
              child: Icon(Icons.add,color: Colors.white,)),
        );
      }),
    );
  }
}
