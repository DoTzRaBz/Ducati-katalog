import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/spare_part_cart_provider.dart';
import '../widgets/drawer_navigation.dart';
import 'checkout_screen.dart';

class SparePartCartScreen extends StatelessWidget {
  const SparePartCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<SparePartCartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spare Part Cart'),
        backgroundColor: Colors.red,
      ),
      drawer: const DrawerNavigation(),
      body: cartProvider.items.isEmpty
          ? const Center(
              child: Text(
                'Your spare part cart is empty.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartProvider.items.values
                          .toList()[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.asset(
                              cartItem.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(cartItem.name),
                            subtitle: Text(
                              'Rp ${cartItem.price.toStringAsFixed(0)}',
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    cartProvider.removeSingleItem(cartItem.id);
                                  },
                                ),
                                Text('${cartItem.quantity}'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    cartProvider.addToCart(
                                      cartItem.id,
                                      cartItem.name,
                                      cartItem.price,
                                      cartItem.image,
                                      1, // Add quantity argument
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    cartProvider.removeItem(cartItem.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp ${cartProvider.totalAmount.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutScreen(checkoutType: 'spare_part'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
    );
  }
}
