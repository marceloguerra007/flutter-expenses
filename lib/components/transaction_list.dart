import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final double value;
  final DateTime date;
  final String id;
  final Function(String) onDelete;

  TransactionCard(
      {required this.id,
      required this.title,
      required this.value,
      required this.date,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('R\$$value')),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(DateFormat('d MMM y').format(date),
            style: Theme.of(context).textTheme.subtitle1),
        
        trailing:  (MediaQuery.of(context).size.width > 400) 
          ? TextButton.icon(
              icon: Icon(
                Icons.delete, 
                color: Theme.of(context).errorColor
              ),
              label: Text(
                'Excluir', 
                style: TextStyle(color: Theme.of(context).errorColor)
              ),
              onPressed: () => onDelete(id), 
            )
          : IconButton(              
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => onDelete(id)
            ),
          //],       
      )
    );    
  }
}

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
