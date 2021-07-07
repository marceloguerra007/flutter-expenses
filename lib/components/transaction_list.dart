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
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$$value')),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(date),
          style: Theme.of(context).textTheme.subtitle1
        ),        
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    List<Widget> transactionWidgets = this
        .transactions
        .map<Widget>((tr) =>
            TransactionCard(title: tr.title, value: tr.value, date: tr.date))
        .toList();

    return Container(
        height: 300,
        child: transactionWidgets.isEmpty
            ? Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text('Nenhuma transação cadastrada!',
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ])
            : ListView.builder(
                itemCount: transactionWidgets.length,
                itemBuilder: (ctx, index) {
                  return (transactionWidgets[index]);
                }));
  }
}
