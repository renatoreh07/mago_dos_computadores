class AuthService {
  // Returns 'tech' or 'user' or null
  static Future<String?> login(String email, String pass) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (email.toLowerCase() == 'tecnico@mago.com' && pass == '123456') return 'tech';
    if (email.contains('@')) return 'user';
    return null;
  }
}
