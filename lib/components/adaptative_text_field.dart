//import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;

  const AdaptativeTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return
        /*
      Platform.isIOS 
      ? CupertinoTextField(
          controller: controller,
          keyboardType: keyboardType, //dessa forma funciona também no IOS
          onSubmitted: (value) => onSubmitted(value),
          placeholder: label
          padding : EdgeInsets.symetric(
            horizontal: 6,
            vertical: 12
          )
      );
    */
      TextField(
        decoration: InputDecoration(labelText: label),
        controller: controller,
        keyboardType: keyboardType, //dessa forma funciona também no IOS
        onSubmitted: (value) => onSubmitted(value),
    );
  }
}
