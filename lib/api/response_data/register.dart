class RegisterData {
  // "id": 6,
  //       "first_name": "",
  //       "last_name": "",
  //       "username": "paseo1st",
  //       "email": "lukmann.dev@gmail.com",
  //       "is_active": true,
  //       "is_admin": false
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final bool isActive;
  final bool isAdmin;

  RegisterData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.isActive,
    required this.isAdmin,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      isActive: json['is_active'],
      isAdmin: json['is_admin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      'is_active': isActive,
      'is_admin': isAdmin,
    };
  }
}
