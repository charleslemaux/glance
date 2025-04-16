import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;
  String? _userEmail;
  String? _error;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get userEmail => _userEmail;
  String? get error => _error;

  final Account account;

  AuthProvider({required this.account}) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    try {
      final user = await account.get();
      _userEmail = user.email;
      _isAuthenticated = true;
      _error = null;
    } catch (e) {
      _isAuthenticated = false;
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await account.createEmailPasswordSession(email: email, password: password);
      final user = await account.get();
      _userEmail = user.email;
      _isAuthenticated = true;
    } catch (e) {
      _error = e.toString();
      _isAuthenticated = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await account.deleteSession(sessionId: 'current');
      _isAuthenticated = false;
      _userEmail = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}