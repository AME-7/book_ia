class RegisterParames {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegisterParames({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };
}
