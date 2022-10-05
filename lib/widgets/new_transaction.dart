// ignore: file_names
// ignore_for_file: prefer_const_constructors

//import 'package:expense_planner_app/widgets/user_transaction.dart';
//import 'dart:html';

import 'package:flutter/material.dart';
//import 'user_transaction.dart';

class NewTransactions extends StatefulWidget {
  final Function addfx;
  NewTransactions(this.addfx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  void onbtnSubmitted(){
    final String titlein= titleinput.text;
    final double amountin=  double.parse(amountinput.text);

    if(titlein.isEmpty || amountin<=0){
      return;
    }

    widget.addfx(titlein,amountin);

   // Navigator.of(context).pop();
  }
  


  final titleinput = TextEditingController();

  final amountinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(5),
        elevation: 5,
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Title', contentPadding: EdgeInsets.all(10)),
            //onChanged: (text){
            //title=text;1
            controller: titleinput,
            onSubmitted:  (val) => onbtnSubmitted(),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Amount', contentPadding: EdgeInsets.all(10)),
            //onChanged: (text){
            //amount=text;}
            controller: amountinput,
            onSubmitted: (val) => onbtnSubmitted(),
            keyboardType: TextInputType.number,
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
                      print('button pressed');
                      onbtnSubmitted();
                    },
                    child: Text(
                      'Add new Transaction',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )),
              ],
            ),
          ),
        ]));
  }
}
