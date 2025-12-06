import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/auth_provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/drawer_navigation.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);

    final userEmail = authProvider.currentUser?.email;
    final transactions = userEmail != null ? transactionProvider.getTransactionsForUser(userEmail) : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
      drawer: const DrawerNavigation(),
      body: transactions.isEmpty
          ? const Center(
              child: Text(
                'You have no transactions yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
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
                      // Use a collection 'for' with explicit casting and null checks for robustness.
                      // This is the definitive fix for the 'List<dynamic>' vs 'List<Widget>' error.
                      children: [
                        for (final item in transaction.items)
                          Builder(builder: (context) {
                            // Safely access item properties
                            final imagePath = item['image'] as String? ?? '';
                            final name = item['name'] as String? ?? 'N/A';
                            final price = (item['price'] as num?) ?? 0;
                            final quantity = (item['quantity'] as num?) ?? 0;

                            return ListTile(
                              leading: imagePath.isNotEmpty
                                  ? Image.asset(
                                      imagePath,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image, size: 50);
                                      },
                                    )
                                  : const Icon(Icons.image_not_supported, size: 50),
                              title: Text(name),
                              subtitle: Text('Rp ${price.toStringAsFixed(0)}'),
                              trailing: Text('x$quantity'),
                            );
                          }),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
