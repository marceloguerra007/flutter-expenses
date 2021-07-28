import 'dart:ui';

import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/services.dart';
import '../models/transaction.dart';

import 'package:expenses/components/transaction_form.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight]);

    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline3: TextStyle(fontFamily: 'OpenSans', fontSize: 15),
              button:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight
                          .bold))) //Swatch define uma lista de cores do Material Design.
          ),
      //supportedLocales: [const Locale('pt','BR')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<Transaction> _transactions = [];
  bool _showChart = false;
  /*= [
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
  ];*/

  List<Transaction> get _recentTransaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); //Fechar o modal.
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
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
    final mediaQuery = MediaQuery.of(context);
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
            fontSize: 10 *
                mediaQuery
                    .textScaleFactor), //Usado para considerar uma escala quando há acessibilidade
      ),
      actions: [
        if (isLandScape)
          IconButton(
            icon: Icon(_showChart ? Icons.list : Icons.show_chart),
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
          ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ],
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_transactions.isNotEmpty && (!isLandScape || _showChart))
                Container(
                    height: availableHeight * (isLandScape ? 0.70 : 0.30),
                    child: Chart(_recentTransaction)),
              if (!isLandScape || !_showChart)
                Container(
                    height: availableHeight * (isLandScape ? 0.5 : 0.30),
                    child: TransactionList(_transactions, _deleteTransaction))
            ],
          ),
        ),
        floatingActionButton: /*Platform.isIOS //Não pode ser utilizado em apps Web
          ? Container()
          : */
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context)
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
