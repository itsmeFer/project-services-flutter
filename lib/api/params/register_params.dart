class RegisterParams {
  final String username;
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterParams({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password1': password,
      'password2': passwordConfirmation,
    };
  }
}
