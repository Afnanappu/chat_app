import 'package:chat_app/core/app_exception_handler.dart';
import 'package:chat_app/feature/auth/models/user_app_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService extends AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      AppExceptionHandler.handleException(e);
    }
  }

  @override
  Future<void> signUp(
    String username,
    String email,
    String password,
    String? profileImage,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) return;

      await userCredential.user?.updateDisplayName(username);

      final user = UserAppModel(
        uid: userCredential.user!.uid,
        username: username,
        email: email,
        profileImage: profileImage,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toMap());
    } catch (e) {
      AppExceptionHandler.handleException(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

abstract class AuthService {
  Future<void> signIn(String email, String password);

  Future<void> signUp(
    String username,
    String email,
    String password,
    String? profileImage,
  );
  Future<void> signOut();
}
