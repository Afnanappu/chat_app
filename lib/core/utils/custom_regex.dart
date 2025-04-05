class CustomRegex {
  ///Regexp for username
  static final userNameRegex = RegExp(r'^[a-zA-Z0-9_]{3,16}$');

  ///Regexp for email
  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  ///Regexp for simple password
  static final passwordRegex = RegExp(r'^[a-zA-Z0-9]{8,}$');

  static bool isValidEmail(String email) => emailRegex.hasMatch(email);

  static bool isValidPassword(String password) =>
      passwordRegex.hasMatch(password);

  static bool isValidUsername(String username) =>
      userNameRegex.hasMatch(username);
}
