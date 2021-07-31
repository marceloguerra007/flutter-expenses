//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed
  });
  
  @override
  Widget build(BuildContext context) {
    return
        /* Platform.isIOS
      ? CupertinoButton(
        child: Text(label),
        onPressed: this.onPressed,
        color: color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symetric(
          horizontal: 20
        )
      )
      : */
      ElevatedButton(        
        child: Text(
          label, 
          style: TextStyle(color: Theme.of(context).textTheme.button!.color)),
        onPressed: onPressed,
      );    
  }
}
