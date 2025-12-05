import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../widgets/drawer_navigation.dart'; // Import the drawer

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.currentUser != null) {
      _nameController.text = authProvider.currentUser!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

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

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      drawer: const DrawerNavigation(), // Add the drawer here
      body: user == null
          ? const Center(child: Text('You are not logged in.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => authProvider.updateProfilePicture(),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: backgroundImage,
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 18,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      authProvider.updateUser(_nameController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated!')),
                      );
                    },
                    child: const Text('Save Changes'),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      authProvider.logout();
                      // Potentially navigate back to login or home
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
