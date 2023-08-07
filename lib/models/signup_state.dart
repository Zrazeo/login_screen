class SignUpState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpState({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  SignUpState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
