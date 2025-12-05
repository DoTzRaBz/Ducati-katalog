import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/database_helper.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper();
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> login(String email, String password) async {
    User? user = await _db.getUser(email, password);
    if (user != null) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    // Check if user already exists
    // Note: A more robust implementation would query the DB for the email
    User newUser = User(
      name: name,
      email: email,
      password: password,
      profilePicture: 'assets/Ducati_red_logo.png', // Default picture
    );
    int id = await _db.saveUser(newUser);
    if (id > 0) {
      _currentUser = newUser.copyWith(id: id);
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> updateUser(String newName) async {
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(name: newName);
      await _db.updateUser(_currentUser!);
      notifyListeners();
    }
  }

  Future<void> updateProfilePicture() async {
    if (_currentUser == null) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _currentUser = _currentUser!.copyWith(profilePicture: pickedFile.path);
      await _db.updateUser(_currentUser!);
      notifyListeners();
    }
  }
}
