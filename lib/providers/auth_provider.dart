import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class User {
  final String name;
  final String email;
  String? profilePicture;

  User({required this.name, required this.email, this.profilePicture});
}

class AuthProvider with ChangeNotifier {
  final SharedPreferences prefs;
  User? _currentUser;

  AuthProvider(this.prefs) {
    _loadUser();
  }

  User? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  void _loadUser() {
    final name = prefs.getString('userName');
    final email = prefs.getString('userEmail');
    final profilePicture = prefs.getString('userProfilePicture');

    if (name != null && email != null) {
      _currentUser = User(
        name: name,
        email: email,
        profilePicture: profilePicture,
      );
    }
  }

  Future<void> _saveUser() async {
    if (_currentUser != null) {
      await prefs.setString('userName', _currentUser!.name);
      await prefs.setString('userEmail', _currentUser!.email);
      if (_currentUser!.profilePicture != null) {
        await prefs.setString(
          'userProfilePicture',
          _currentUser!.profilePicture!,
        );
      }
    }
  }

  Future<bool> login(String email, String password) async {
    // In a real app, you would have proper authentication logic here.
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUser = User(name: 'User', email: email);
      await _saveUser();
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    await prefs.remove('userName');
    await prefs.remove('userEmail');
    await prefs.remove('userProfilePicture');
    notifyListeners();
  }

  Future<bool> register(String name, String email, String password) async {
    // In a real app, you would have proper registration logic here.
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _currentUser = User(name: name, email: email);
      await _saveUser();
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> updateProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _currentUser?.profilePicture = pickedFile.path;
      await _saveUser();
      notifyListeners();
    }
  }

  void updateUser(String name) {
    if (_currentUser != null) {
      _currentUser = User(
        name: name,
        email: _currentUser!.email,
        profilePicture: _currentUser!.profilePicture,
      );
      _saveUser();
      notifyListeners();
    }
  }
}
