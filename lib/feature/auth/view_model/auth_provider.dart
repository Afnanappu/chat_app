import 'package:chat_app/feature/auth/repositories/auth_repository.dart';

class AuthProvider {
  final AuthRepository _repository;

  AuthProvider(this._repository);

  /// Signs in with the given email and password.
  /// If the user does not exist, exception is thrown.
  Future<void> signIn(String email, String password) async =>
      _repository.signIn(email, password);

  /// Signs up a new user with the given username, email, and password.
  ///
  /// This method attempts to create a new user account using the provided
  /// username, email, and password. If successful, the new user is created
  /// and stored in the authentication system and database.
  ///
  /// Throws an exception if the sign-up process fails.
  Future<void> signUp(String username, String email, String password) async =>
      _repository.signUp(username, email, password);

  Future<void> signOut() async => _repository.signOut();
}
