import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/spare_part_model.dart';
import '../providers/spare_part_provider.dart';
import '../providers/spare_part_cart_provider.dart';
import '../widgets/drawer_navigation.dart';

class SparePartScreen extends StatelessWidget {
  const SparePartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
        elevation: 0,
        title: Consumer<SparePartProvider>(
          builder: (context, provider, child) {
            return Text(
              provider.selectedMotor != null
                  ? provider.selectedMotor!['name']!.toUpperCase()
                  : 'SPARE PARTS',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          },
        ),
        leading: Consumer<SparePartProvider>(
          builder: (context, provider, child) {
            if (provider.selectedMotor != null) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  provider.clearSelectedMotor();
                },
              );
            }
            return Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
      ),
      body: Consumer<SparePartProvider>(
        builder: (context, provider, child) {
          if (provider.selectedMotor == null) {
            return const MotorSelectionGrid();
          } else {
            return const CatalogScreen();
          }
        },
      ),
    );
  }
}

class MotorSelectionGrid extends StatelessWidget {
  const MotorSelectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final motors = context.read<SparePartProvider>().motors;
    return Container(
      color: Colors.grey[100],
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.75,
        ),
        itemCount: motors.length,
        itemBuilder: (context, index) {
          final motor = motors[index];
          return GestureDetector(
            onTap: () {
              context.read<SparePartProvider>().selectMotor(motor);
            },
            child: Card(
              elevation: 2.0,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12.0),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          motor['image']!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.motorcycle, size: 64.0, color: Colors.grey);
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      motor['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SparePartProvider>();

    if (provider.catalogs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No catalog available',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    final catalog = provider.catalogs[provider.selectedCatalogIndex];

    return Column(
      children: [
        // Catalog Navigation Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: provider.selectedCatalogIndex > 0 ? Colors.red[700] : Colors.grey[300],
                ),
                onPressed: provider.selectedCatalogIndex > 0
                    ? () => provider.previousCatalog()
                    : null,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      catalog.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${provider.selectedCatalogIndex + 1} / ${provider.catalogs.length}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: provider.selectedCatalogIndex < provider.catalogs.length - 1
                      ? Colors.red[700]
                      : Colors.grey[300],
                ),
                onPressed: provider.selectedCatalogIndex < provider.catalogs.length - 1
                    ? () => provider.nextCatalog()
                    : null,
              ),
            ],
          ),
        ),

        // Main Content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Diagram Image Section
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            children: [
                              InteractiveViewer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    catalog.image,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error, size: 64.0, color: Colors.red);
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                                  onPressed: () => Navigator.pop(context),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          catalog.image,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(Icons.error, size: 48.0, color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // Parts List
                Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 4,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.red[700],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'PARTS LIST',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: catalog.parts.length,
                        itemBuilder: (context, index) {
                          final part = catalog.parts[index];
                          return _buildPartCard(context, part, provider, index);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Total Section
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Rp ${provider.totalPrice.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPartCard(BuildContext context, part, SparePartProvider provider, int index) {
    final catalog = provider.catalogs[provider.selectedCatalogIndex];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Item Number Badge
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        part.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        part.partNumber,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Text(
                  'Rp ${part.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green[700],
                  ),
                ),
                // Quantity Controls
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 20),
                            onPressed: () {
                              provider.decrementPartQuantity(
                                provider.selectedCatalogIndex,
                                index,
                              );
                            },
                            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                            padding: EdgeInsets.zero,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              part.quantity.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, size: 20),
                            onPressed: () {
                              provider.incrementPartQuantity(
                                provider.selectedCatalogIndex,
                                index,
                              );
                            },
                            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Add to Cart Button
                    Container(
                      decoration: BoxDecoration(
                        color: part.quantity > 0 ? Colors.red[700] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                        onPressed: part.quantity > 0
                            ? () {
                                final cart = Provider.of<SparePartCartProvider>(context, listen: false);
                                cart.addToCart(part.partNumber, part.name, part.price, catalog.image, part.quantity);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${part.quantity} x ${part.name} added to cart!',
                                    ),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: Colors.green[700],
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            : null,
                        constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
