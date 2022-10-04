// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:expense_planner_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'user_transaction.dart';

class NewTransactions extends StatelessWidget {
  final Function addfx;
  NewTransactions(this.addfx);
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
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Amount', contentPadding: EdgeInsets.all(10)),
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
                      addfx( titleinput.text,double.tryParse(amountinput.text));
                    },
                    child: Text(
                      'Add new Transaction',
                      style: TextStyle(color: Colors.deepPurple),
                    )),
              ],
            ),
          ),
        ]));
  }
}
