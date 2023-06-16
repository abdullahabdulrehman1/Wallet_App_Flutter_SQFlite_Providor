// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/constants/icons.dart';

class ExpenseCategory {
  final String title;
  int entries = 0;
  double totalAmount = 0.0;
  final Icon icon;

  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount,
        'icon': icon,
      };

  factory ExpenseCategory.fromMap(Map<String, dynamic> value) {
    return ExpenseCategory(
      title: value['title'],
      entries: value['entries'],
      totalAmount: double.parse(value['totalAmount']),
      icon: icons[value['icon']],
    );
  }
}
