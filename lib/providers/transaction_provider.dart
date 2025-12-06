import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Transaction {
  final String id;
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final String dealer;
  final DateTime date;
  final String userEmail;

  Transaction({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.dealer,
    required this.date,
    required this.userEmail,
  });

  // Convert a Transaction object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items,
      'totalAmount': totalAmount,
      'dealer': dealer,
      'date': date.toIso8601String(), // Convert DateTime to a string
      'userEmail': userEmail,
    };
  }

  // Create a Transaction object from a Map
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      items: List<Map<String, dynamic>>.from(map['items']),
      totalAmount: map['totalAmount'],
      dealer: map['dealer'],
      date: DateTime.parse(map['date']), // Parse the string back to DateTime
      userEmail: map['userEmail'],
    );
  }
}

class TransactionProvider with ChangeNotifier {
  final SharedPreferences prefs;
  List<Transaction> _transactions = [];

  static const String _transactionsKey = 'transactions';

  TransactionProvider(this.prefs) {
    _loadTransactions();
  }

  void _loadTransactions() {
    final transactionsString = prefs.getString(_transactionsKey);
    if (transactionsString != null) {
      final List<dynamic> transactionList = json.decode(transactionsString);
      _transactions = transactionList.map((txMap) => Transaction.fromMap(txMap)).toList();
    }
  }

  Future<void> _saveTransactions() async {
    final transactionList = _transactions.map((tx) => tx.toMap()).toList();
    await prefs.setString(_transactionsKey, json.encode(transactionList));
  }

  List<Transaction> getTransactionsForUser(String userEmail) {
    // This correctly returns transactions for the current user from the in-memory list.
    return _transactions.where((tx) => tx.userEmail == userEmail).toList();
  }

  void addTransaction(List<Map<String, dynamic>> cartItems, double total, String dealer, String userEmail) {
    _transactions.insert(
      0,
      Transaction(
        id: DateTime.now().toString(),
        items: cartItems,
        totalAmount: total,
        dealer: dealer,
        date: DateTime.now(),
        userEmail: userEmail,
      ),
    );
    _saveTransactions(); // Save the updated list to persistent storage
    notifyListeners();
  }

  void clearTransactions() {
    _transactions.clear();
    _saveTransactions(); // Also update storage on clearing
    notifyListeners();
  }
}
