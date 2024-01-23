import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String validEmail = "rotadosabores@gmail.com";
  static const String validPassword = "12345";

  static Future<bool> login(String email, String password) async {
    // Simulate authentication delay
    await Future.delayed(Duration(seconds: 2));

    // Check if the provided credentials are valid
    bool isAuthenticated = email == validEmail && password == validPassword;

    if (isAuthenticated) {
      // Save authentication state to shared_preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
    }

    return isAuthenticated;
  }

  static Future<void> logout() async {
    // Clear authentication state in shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isAuthenticated');
  }

  static Future<bool> checkAuthState() async {
    // Check authentication state in shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAuthenticated') ?? false;
  }
}
