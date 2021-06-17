import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

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
            value.toString(),
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
              date.toString(),
              style: TextStyle(fontSize: 14, color: Colors.black),
            )
          ],
        )
      ],
    ));
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(id: '1', title: 'Livro', value: 37.50, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Mercado SV', value: 121.77, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> transactionWidgets = _transactions
        .map<Widget>((tr) =>
            TransactionCard(title: tr.title, value: tr.value, date: tr.date))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(child: Text('Gráfico'), elevation: 5),
          ),
          Column(children: <Widget>[...transactionWidgets])
        ],
      ),
    );
  }
}
