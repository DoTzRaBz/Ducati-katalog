import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './providers/auth_provider.dart';
import './providers/cart_provider.dart';
import './providers/favorites_provider.dart';
import './providers/product_provider.dart';
import './providers/spare_part_provider.dart'; // Import SparePartProvider
import './screens/cart_screen.dart';
import './screens/event_screen.dart';
import './screens/favorites_screen.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/map_screen.dart';
import './screens/product_screen.dart';
import './screens/profile_screen.dart';
import './screens/register_screen.dart';
import './screens/spare_part_screen.dart'; // Import SparePartScreen
import './screens/wdw_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = ProductProvider();

    final router = GoRouter(
      initialLocation: '/login', // Keep initial at login
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/product/:id',
          builder: (context, state) {
            final productId = state.pathParameters['id']!;
            final product = productProvider.findById(productId);
            return ProductScreen(product: product);
          },
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartScreen(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(
          path: '/profile', // Add profile route
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => const MapScreen(),
        ),
        GoRoute(
          path: '/event',
          builder: (context, state) => const EventScreen(),
        ),
        GoRoute(
          path: '/wdw',
          builder: (context, state) => const WdwScreen(),
        ),
        GoRoute(
          path: '/spare-parts',
          builder: (context, state) => const SparePartScreen(),
        ),
      ],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), // Add AuthProvider
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider.value(value: productProvider),
        ChangeNotifierProvider(create: (_) => SparePartProvider()), // Add SparePartProvider
      ],
      child: MaterialApp.router(
        title: 'Ducati',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: router,
      ),
    );
  }
}
