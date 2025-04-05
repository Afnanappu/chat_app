import 'package:chat_app/core/dependencies.dart';
import 'package:chat_app/feature/auth/repositories/auth_repository.dart';
import 'package:chat_app/feature/auth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

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
  Future<void> signUp(
    String username,
    String email,
    String password,
    String? profileImage,
  ) async => _repository.signUp(username, email, password, profileImage);

  Future<void> signOut() async => _repository.signOut();

  bool isAlreadySignIn() => FirebaseAuth.instance.currentUser != null;
}

@riverpod
AuthProvider auth(Ref ref) {
  final repository = AuthRepository(getIt.get<AuthFirebaseService>());
  return AuthProvider(repository);
}
