import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final double value;
  final DateTime date;

  TransactionCard(
      {required this.title, required this.value, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          padding: EdgeInsets.all(10),
          child: Text(
            'R\$ ${value.toStringAsFixed(2)}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.orange),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat('d MMM y').format(date),
              style: TextStyle(fontSize: 14, color: Colors.black),
            )
          ],
        )
      ],
    ));
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    List<Widget> transactionWidgets = this.transactions
      .map<Widget>((tr) =>
          TransactionCard(title: tr.title, value: tr.value, date: tr.date))
      .toList();

    return Column(children: <Widget>[...transactionWidgets]);
  }
}
