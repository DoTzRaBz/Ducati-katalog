
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/cart_provider.dart' as product_cart;
import '../providers/spare_part_cart_provider.dart' as spare_part_cart;
import '../providers/transaction_provider.dart';

class CheckoutItem {
  final String image;
  final String name;
  final double price;
  final int quantity;

  CheckoutItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CheckoutScreen extends StatefulWidget {
  final String checkoutType;

  const CheckoutScreen({super.key, required this.checkoutType});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDealer;
  final _dealers = ['Ducati Jakarta', 'Ducati Bandung', 'Ducati Surabaya'];

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  final _cardNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      final transactionProvider = Provider.of<TransactionProvider>(context, listen: false);

      if (widget.checkoutType == 'product') {
        final cart = Provider.of<product_cart.CartProvider>(context, listen: false);
        final items = cart.items.values.map((item) => {
          'image': item.image,
          'name': item.name,
          'price': item.price,
          'quantity': item.quantity,
        }).toList();
        transactionProvider.addTransaction(items, cart.totalAmount, _selectedDealer!);
        cart.clearCart();
      } else {
        final sparePartCart = Provider.of<spare_part_cart.SparePartCartProvider>(context, listen: false);
        final items = sparePartCart.items.values.map((item) => {
          'image': item.image,
          'name': item.name,
          'price': item.price,
          'quantity': item.quantity,
        }).toList();
        transactionProvider.addTransaction(items, sparePartCart.totalAmount, _selectedDealer!);
        sparePartCart.clearCart();
      }

      context.go('/transaction-history');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<CheckoutItem> items;
    final double totalAmount;

    if (widget.checkoutType == 'product') {
      final cart = Provider.of<product_cart.CartProvider>(context);
      items = cart.items.values
          .map((cartItem) => CheckoutItem(
                image: cartItem.image,
                name: cartItem.name,
                price: cartItem.price,
                quantity: cartItem.quantity,
              ))
          .toList();
      totalAmount = cart.totalAmount;
    } else {
      final sparePartCart = Provider.of<spare_part_cart.SparePartCartProvider>(context);
      items = sparePartCart.items.values
          .map((cartItem) => CheckoutItem(
                image: cartItem.image,
                name: cartItem.name,
                price: cartItem.price,
                quantity: cartItem.quantity,
              ))
          .toList();
      totalAmount = sparePartCart.totalAmount;
    }

    const shippingCost = 15000;
    final grandTotal = totalAmount + shippingCost;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionCard(
                title: 'Alamat Pengiriman',
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nama Penerima'),
                      validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(labelText: 'Alamat Lengkap'),
                      validator: (value) => value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty ? 'Nomor telepon tidak boleh kosong' : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                title: 'Ringkasan Pesanan',
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: Image.asset(items[i].image, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(items[i].name),
                    subtitle: Text('Rp ${items[i].price.toStringAsFixed(0)}'),
                    trailing: Text('x${items[i].quantity}'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                title: 'Pengiriman',
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedDealer,
                      hint: const Text('Pilih Dealer'),
                      items: _dealers.map((dealer) {
                        return DropdownMenuItem(value: dealer, child: Text(dealer));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDealer = value;
                        });
                      },
                      validator: (value) => value == null ? 'Pilih dealer terlebih dahulu' : null,
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    const ListTile(
                      leading: Icon(Icons.local_shipping),
                      title: Text('Jasa Pengiriman'),
                      subtitle: Text('Reguler (Estimasi 2-3 hari)'),
                      trailing: Text('Rp 15.000'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                title: 'Metode Pembayaran',
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('Kartu Kredit/Debit'),
                    ),
                    TextFormField(
                      controller: _cardNameController,
                      decoration: const InputDecoration(labelText: 'Nama pada Kartu'),
                      validator: (value) => value!.isEmpty ? 'Nama pada kartu tidak boleh kosong' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(labelText: 'Nomor Kartu'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Nomor kartu tidak boleh kosong';
                        if (value.length != 16) return 'Nomor kartu harus 16 digit';
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _expiryDateController,
                            decoration: const InputDecoration(labelText: 'MM/YY'),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value!.isEmpty) return 'Tanggal kedaluwarsa tidak boleh kosong';
                              if (!RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(value)) {
                                return 'Format harus MM/YY';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _cvvController,
                            decoration: const InputDecoration(labelText: 'CVV'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) return 'CVV tidak boleh kosong';
                              if (value.length != 3) return 'CVV harus 3 digit';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                title: 'Rincian Biaya',
                child: Column(
                  children: [
                    _buildSummaryRow('Total Harga', totalAmount),
                    _buildSummaryRow('Total Ongkos Kirim', shippingCost.toDouble()),
                    const Divider(height: 20),
                    _buildSummaryRow('Total Tagihan', grandTotal, isTotal: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _submitOrder,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          child: const Text('Bayar Sekarang'),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text('Rp ${amount.toStringAsFixed(0)}', style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
