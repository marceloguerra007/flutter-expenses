import 'dart:ui';

import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import '../models/transaction.dart';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/chart.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline3: TextStyle(fontFamily: 'OpenSans', fontSize: 15)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight
                          .bold))) //Swatch define uma lista de cores do Material Design.
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1',
        title: 'Livro',
        value: 37.50,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: '2',
        title: 'Mercado SV',
        value: 121.77,
        date: DateTime.now().subtract(Duration(days: 3)))
  ];

  List<Transaction> get _recentTransaction {
      return _transactions.where((tr) {
        return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      }).toList();      
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); //Fechar o modal.
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
          title: Text(
            'Despesas Pessoais',
          ),
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
              Chart(_recentTransaction),
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
