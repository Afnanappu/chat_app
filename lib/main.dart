import 'dart:io';

import 'package:chat_app/core/theme/app_theme.dart';
import 'package:chat_app/routes/route_names.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    // Custom error handling to catch memory-related issues
    if (details.exception.toString().contains('memory') ||
        details.exception.toString().contains('dispose')) {
      debugPrint('POTENTIAL MEMORY LEAK: ${details.exception}');
      debugPrint('CONTEXT: ${details.context}');
      debugPrint('STACK TRACE: ${details.stack}');
      // print('POTENTIAL MEMORY LEAK: ${details.exception}');
      // print('CONTEXT: ${details.context}');
      // print('STACK TRACE: ${details.stack}');
    }
    // Forward to normal error handling
    FlutterError.presentError(details);
  };

  FirebaseAuth.instance.userChanges().listen((user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
    } else {
      debugPrint('User is signed in!');
    }
  });

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   while (true) {
    //     await Future.delayed(Duration(seconds: 5), () {
    //       printMemoryUsage();
    //     });
    //   }
    // });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.auth,
      routes: routes,
    );
  }
}

// Helper function to periodically check memory usage
void printMemoryUsage() {
  debugPrint(
    'Current memory usage: ${(ProcessInfo.currentRss / 1024 / 1024).toStringAsFixed(2)}MB',
  );
  // Future.delayed(Duration(seconds: 5), printMemoryUsage);
}
