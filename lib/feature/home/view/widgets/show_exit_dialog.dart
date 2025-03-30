import 'package:flutter/material.dart';

Future<bool> showExitDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              insetPadding: EdgeInsets.zero,
              title: Text("Exit App"),
              content: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  onPressed:
                      () => Navigator.of(context).pop(false), // Stay in app
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true), // Exit app
                  child: Text("Exit"),
                ),
              ],
            ),
      ) ??
      false;
}
