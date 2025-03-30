import 'package:chat_app/feature/home/view/screens/screen_home.dart';
import 'package:chat_app/routes/route_names.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.home: (context) => const ScreenHome(),
};
