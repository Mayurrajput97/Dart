class InputValidator {
  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
