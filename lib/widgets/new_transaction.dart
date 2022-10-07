// ignore: file_names
// ignore_for_file: prefer_const_constructors

//import 'package:expense_planner_app/widgets/user_transaction.dart';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'user_transaction.dart';

class NewTransactions extends StatefulWidget {
  final Function addfx;

  NewTransactions(this.addfx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  DateTime? _selectedDate;
  void onbtnSubmitted() {
    final String titlein = titleinput.text;
    final double amountin = double.parse(amountinput.text);
    final DateTime? date = _selectedDate;

    if (titlein.isEmpty || amountin <= 0 || _selectedDate == null ) {
      return;
    }

    widget.addfx(titlein, amountin, date);

    // Navigator.of(context).pop();
  }

  void _presentdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        setState(() {
          _selectedDate = value;
        });
      }
    });
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
            onSubmitted: (val) => onbtnSubmitted(),
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
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        _selectedDate != null
                            ? DateFormat.yMd().format(_selectedDate!)
                            : 'No Date!',
                        style: TextStyle(color: Colors.grey))),
                TextButton(
                    onPressed: _presentdatepicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () {
                      print('button pressed');
                      onbtnSubmitted();
                    },
                    child: Text(
                      'Add new Transaction',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ]));
  }
}
