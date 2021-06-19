import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Título'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Valor (R\$'),
                    controller: valueController,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {},
                        child: Text('Nova Transação',
                            style: TextStyle(color: Colors.orange))),
                  ])
                ],
              ),
            ),
          );
  }
}