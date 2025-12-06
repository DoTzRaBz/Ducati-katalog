import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class User {
  final String name;
  final String email;
  final String password; // Storing password here for simplicity, not for production apps!
  String? profilePicture;

  User({
    required this.name,
    required this.email,
    required this.password,
    this.profilePicture,
  });

  // Methods to convert User object to and from a map, useful for JSON encoding/decoding
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      profilePicture: map['profilePicture'],
    );
  }
}

class AuthProvider with ChangeNotifier {
  final SharedPreferences prefs;
  User? _currentUser;
  List<User> _users = [];

  static const String _usersKey = 'users';
  static const String _loggedInUserKey = 'loggedInUserEmail';

  AuthProvider(this.prefs) {
    _loadUsers();
    _loadCurrentUser();
  }

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  void _loadUsers() {
    final usersString = prefs.getString(_usersKey);
    if (usersString != null) {
      final List<dynamic> userList = json.decode(usersString);
      _users = userList.map((userMap) => User.fromMap(userMap)).toList();
    }
  }

  void _loadCurrentUser() {
    final loggedInUserEmail = prefs.getString(_loggedInUserKey);
    if (loggedInUserEmail != null) {
      try {
        _currentUser = _users.firstWhere((user) => user.email == loggedInUserEmail);
      } catch (e) {
        // User might have been deleted, so clear the logged in user key
        prefs.remove(_loggedInUserKey);
        _currentUser = null;
      }
    }
  }

  Future<void> _saveUsers() async {
    final userList = _users.map((user) => user.toMap()).toList();
    await prefs.setString(_usersKey, json.encode(userList));
  }

  Future<bool> login(String email, String password) async {
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      _currentUser = user;
      await prefs.setString(_loggedInUserKey, user.email);
      notifyListeners();
      return true;
    } catch (e) {
      return false; // User not found
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    await prefs.remove(_loggedInUserKey);
    notifyListeners();
  }

  Future<bool> register(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }

    // Check if user already exists
    if (_users.any((user) => user.email == email)) {
      return false; // A user with this email already exists
    }

    final newUser = User(name: name, email: email, password: password);
    _users.add(newUser);
    await _saveUsers();

    // Automatically log in the new user
    _currentUser = newUser;
    await prefs.setString(_loggedInUserKey, newUser.email);
    notifyListeners();
    return true;
  }

  Future<void> updateProfilePicture() async {
    if (_currentUser == null) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final userIndex = _users.indexWhere((user) => user.email == _currentUser!.email);
      if (userIndex != -1) {
        _currentUser!.profilePicture = pickedFile.path;
        _users[userIndex] = _currentUser!;
        await _saveUsers();
        notifyListeners();
      }
    }
  }

  void updateUser(String name) {
    if (_currentUser == null || name.isEmpty) return;

    final userIndex = _users.indexWhere((user) => user.email == _currentUser!.email);
    if (userIndex != -1) {
      _currentUser = User(
        name: name,
        email: _currentUser!.email,
        password: _currentUser!.password, // Ensure password is preserved
        profilePicture: _currentUser!.profilePicture,
      );
      _users[userIndex] = _currentUser!;
      _saveUsers();
      notifyListeners();
    }
  }
}
