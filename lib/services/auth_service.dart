class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isAuthenticated = false;
  String? _currentUser;

  bool get isAuthenticated => _isAuthenticated;
  String? get currentUser => _currentUser;

  Future<bool> login(String email, String password) async {
    // Имитация проверки учетных данных
    await Future.delayed(const Duration(seconds: 1));

    if (email.contains('@') && password.length >= 6) {
      _isAuthenticated = true;
      _currentUser = email;
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _isAuthenticated = false;
    _currentUser = null;
  }

  Future<bool> register(String email, String password, String name) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.contains('@') && password.length >= 6 && name.isNotEmpty) {
      _isAuthenticated = true;
      _currentUser = email;
      return true;
    }
    return false;
  }

  void resetPassword(String email) {
    // Имитация сброса пароля
    print('Password reset email sent to: $email');
  }
}
