import 'package:flutter/material.dart';
import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import '../models/transaction.dart';

import 'package:expenses/components/transaction_form.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(id: '1', title: 'Livro', value: 37.50, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Mercado SV', value: 121.77, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {        
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return TransactionForm(_addTransaction);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
          actions: [
            IconButton(
                onPressed: () => _openTransactionFormModal(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(child: Text('Gráfico'), elevation: 5),
              ),
              TransactionList(_transactions)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
