import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;
    final cartProvider = Provider.of<CartProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final cartCount = cartProvider.itemCount;
    final favoritesCount = favoritesProvider.favoriteProductIds.length;

    ImageProvider<Object> backgroundImage;
    if (user?.profilePicture != null) {
      if (user!.profilePicture!.startsWith('assets/')) {
        backgroundImage = AssetImage(user.profilePicture!);
      } else {
        backgroundImage = FileImage(File(user.profilePicture!));
      }
    } else {
      backgroundImage = const AssetImage('assets/Ducati_red_logo.png');
    }

    return Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user?.name ?? 'Rider Name'),
              accountEmail: Text(user?.email ?? 'rider@ducati.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: backgroundImage,
              ),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () => context.go('/'), // Navigate to Home
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.white), // Added icon for Spare Parts
              title: const Text('Spare Parts', style: TextStyle(color: Colors.white)),
              onTap: () => context.go('/spare-parts'), // Navigate to Spare Parts
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text('Favorites', style: TextStyle(color: Colors.white)),
              trailing: favoritesCount > 0
                  ? CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Text(favoritesCount.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 12)),
                    )
                  : null,
              onTap: () => context.go('/favorites'), // Navigate to Favorites
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.white),
              title: const Text('Cart', style: TextStyle(color: Colors.white)),
              trailing: cartCount > 0
                  ? CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Text(cartCount.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 12)),
                    )
                  : null,
              onTap: () => context.go('/cart'), // Navigate to Cart
            ),
            ListTile(
              leading: const Icon(Icons.map, color: Colors.white),
              title: const Text('Dealer Map', style: TextStyle(color: Colors.white)),
              onTap: () => context.go('/map'), // Navigate to Map
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.white),
              title: const Text('Event', style: TextStyle(color: Colors.white)),
              onTap: () => context.go('/event'), // Navigate to Event
            ),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () => context.go('/profile'), // Navigate to Profile
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                authProvider.logout();
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
