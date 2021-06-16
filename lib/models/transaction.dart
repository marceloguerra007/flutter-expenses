import 'dart:ffi';
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final Double value;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.value,
      required this.date});
}
