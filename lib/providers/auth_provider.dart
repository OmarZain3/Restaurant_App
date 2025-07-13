import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  void login(String email, String password) {
    if (email == 'test@example.com' && password == '123456') {
      state = true;
    } else {
      state = false;
    }
  }

  void logout() {
    state = false;
  }
}
