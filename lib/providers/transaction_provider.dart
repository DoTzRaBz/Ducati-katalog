
import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final String dealer;
  final DateTime date;

  Transaction({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.dealer,
    required this.date,
  });
}

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => [..._transactions];

  void addTransaction(List<Map<String, dynamic>> cartItems, double total, String dealer) {
    _transactions.insert(
      0,
      Transaction(
        id: DateTime.now().toString(),
        items: cartItems,
        totalAmount: total,
        dealer: dealer,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
