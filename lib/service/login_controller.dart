import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController with ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _loading = false;
  String? _errorMessage;
  User? _user;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

  Future<void> login({required String email, required String password}) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      _user = response.user;
      print("Login Response: ${response.session?.accessToken}");
    } on AuthException catch (e) {
      _errorMessage = e.message;
      print("Auth Error: ${e.message}");
    }
  }

  //sign up
  Future<void> signUp({required String email, required String password}) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      _user = response.user;
    } on AuthApiException catch (e) {
      _errorMessage = e.message;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
    _user = null;
    notifyListeners();
  }
}
