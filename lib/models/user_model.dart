class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String? profilePicture;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.profilePicture,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      profilePicture: map['profilePicture'],
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? profilePicture,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
