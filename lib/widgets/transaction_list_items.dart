import 'dart:math';

import 'package:flutter/material.dart';
import '../models/Transactions.dart';
import 'package:intl/intl.dart';

class TransactionListItems extends StatefulWidget {
  const TransactionListItems({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transactions transaction;
  final Function deleteTx;

  @override
  State<TransactionListItems> createState() => _TransactionListItemsState();
}

class _TransactionListItemsState extends State<TransactionListItems> {
var _bgColors;
  @override
  void initState() {
    List<MaterialColor> available = [Colors.amber,Colors.cyan];
    _bgColors=available[Random().nextInt(2)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      elevation: 6,
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
              backgroundColor: _bgColors,
              radius: 30,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                      child: Text(
                    '\$${widget.transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white),
                  )))),
        ),
        title: Text(
          widget.transaction.title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.transaction.time),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: Icon(Icons.delete,color: Theme.of(context).errorColor),
                label: Text('Delete',style: TextStyle(color: Theme.of(context).errorColor)),
                 )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => widget.deleteTx(widget.transaction.id),
              ),
      ),
    );
  }
}
