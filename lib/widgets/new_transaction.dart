// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:expense_planner_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'user_transaction.dart';

class NewTransactions extends StatelessWidget {
  final Function addfx;
  NewTransactions(this.addfx);
  void onSubmitted(){
    final String titlein= titleinput.text;
    final double amountin=  double.parse(amountinput.text);

    if(titlein.isEmpty || amountin<=0){
      return;
    }

    addfx(titlein,amountin);
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
            onSubmitted:  (val) => onSubmitted(),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Amount', contentPadding: EdgeInsets.all(10)),
            //onChanged: (text){
            //amount=text;}
            controller: amountinput,
            onSubmitted: (val) => onSubmitted(),
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
                      onSubmitted;
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
