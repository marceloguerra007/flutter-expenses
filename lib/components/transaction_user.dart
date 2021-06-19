import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({ Key? key }) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(id: '1', title: 'Livro', value: 37.50, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Mercado SV', value: 121.77, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionList(_transactions),
      TransactionForm()
    ],);
  }
}