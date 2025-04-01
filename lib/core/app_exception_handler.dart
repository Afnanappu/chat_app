import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class AppExceptionHandler {
  static String handleException(dynamic e) {
    log(e.toString(), stackTrace: StackTrace.current);
    if (e is FirebaseAuthException) {
      return _handleAuthException(e);
    } else if (e is FirebaseException) {
      return _handleFirestoreException(e);
    } else if (e is SocketException) {
      return "No internet connection. Please check your network.";
    } else if (e is FormatException) {
      return "Invalid response format. Please try again.";
    } else {
      return "An unexpected error occurred. Please try again.";
    }
  }

  // Firebase Authentication Error Handler
  static String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case "email-already-in-use":
        return "This email is already registered. Please use a different email.";
      case "invalid-email":
        return "Invalid email address. Please enter a valid email.";
      case "operation-not-allowed":
        return "Email/password sign-in is disabled. Enable it in Firebase Console.";
      case "weak-password":
        return "Password is too weak. Use a stronger password.";
      case "too-many-requests":
        return "Too many attempts. Please try again later.";
      case "user-token-expired":
        return "Session expired. Please log in again.";
      case "network-request-failed":
        return "Network error. Check your internet connection.";
      default:
        return "An unexpected error occurred. Please try again.";
    }
  }

  // 🔹 Handle Firestore Errors
  static String _handleFirestoreException(FirebaseException e) {
    switch (e.code) {
      case "permission-denied":
        return "You don't have permission to access this data.";
      case "not-found":
        return "Requested document not found.";
      case "already-exists":
        return "Document already exists.";
      case "unavailable":
        return "Firestore service is currently unavailable. Try again later.";
      case "cancelled":
        return "Operation was cancelled.";
      case "deadline-exceeded":
        return "The request took too long. Please check your internet connection.";
      case "resource-exhausted":
        return "Firestore quota exceeded. Try again later.";
      case "internal":
        return "Internal server error. Please try again.";
      default:
        return "An unexpected error occurred with Firestore. Please try again.";
    }
  }
}
