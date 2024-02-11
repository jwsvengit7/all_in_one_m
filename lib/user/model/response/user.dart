class User {
  final String userId;
  final String email;
  final String phoneNumber;
  final String password;

  User({
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password
    };
  }
}
