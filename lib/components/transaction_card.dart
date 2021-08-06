import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final String title;
  final double value;
  final DateTime date;
  final String id;
  final Function(String) onDelete;

  TransactionCard({
      required Key key,
      required this.id,
      required this.title,
      required this.value,
      required this.date,
      required this.onDelete
  }): super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  static const colors = [
    Colors.red,
    Colors.greenAccent,
    Colors.black38,
    Colors.blue,
    Colors.amber
  ];

  Color _backgroundColor = Colors.transparent;

  void initState() {
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _backgroundColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('R\$${widget.value}')),
            ),
          ),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          subtitle: Text(DateFormat('d MMM y').format(widget.date),
              style: Theme.of(context).textTheme.subtitle1),

          trailing: (MediaQuery.of(context).size.width > 400)
              ? TextButton.icon(
                  icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                  label: Text('Excluir',
                      style: TextStyle(color: Theme.of(context).errorColor)
                  ),
                  onPressed: () => widget.onDelete(widget.id),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => widget.onDelete(widget.id)),
          //],
        ));
  }
}
