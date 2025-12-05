
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/transaction_provider.dart';
import '../widgets/drawer_navigation.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: Colors.red,
      ),
      drawer: const DrawerNavigation(),
      body: transactionProvider.transactions.isEmpty
          ? const Center(
              child: Text(
                'You have no transactions yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: transactionProvider.transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactionProvider.transactions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text(
                        'Total: Rp ${transaction.totalAmount.toStringAsFixed(0)}',
                      ),
                      subtitle: Text(
                        '${DateFormat.yMMMd().format(transaction.date)} - ${transaction.dealer}',
                      ),
                      children: transaction.items.map((item) {
                        return ListTile(
                          leading: Image.asset(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                          title: Text(item['name']),
                          subtitle: Text('Rp ${item['price'].toStringAsFixed(0)}'),
                          trailing: Text('x${item['quantity']}'),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
