import 'package:chat_app/feature/auth/services/auth_service.dart';

class AuthRepository {
  final AuthService _service;

  AuthRepository(this._service);

  Future<void> signIn(String email, String password) =>
      _service.signIn(email, password);

  Future<void> signUp(String username, String email, String password) =>
      _service.signUp(username, email, password);

  Future<void> signOut() => _service.signOut();
}
