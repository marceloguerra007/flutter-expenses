import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;

  TransactionList(this.transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {
    List<Widget> transactionWidgets = this
        .transactions
        .map<Widget>((tr) => TransactionCard(
              id: tr.id,
              title: tr.title,
              value: tr.value,
              date: tr.date,
              onDelete: onDelete,
            ))
        .toList();

    return transactionWidgets.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.3,
                child: Text(
                  'Nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.headline3),
                  
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.5,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
              )
            ]);
          })
        : ListView.builder(
            itemCount: transactionWidgets.length,
            itemBuilder: (ctx, index) {
              return (transactionWidgets[index]);
            });
  }
}
