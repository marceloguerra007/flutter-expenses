import 'dart:ffi';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: '1', title: 'Livro', value: 37.50 as Double, date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'Mercado SV',
        value: 121.51 as Double,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
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
          Card(
            child: Text('Lista de Transações'),
          )
        ],
      ),
    );
  }
}
