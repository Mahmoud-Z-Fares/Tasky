import 'package:flutter/material.dart';

abstract class Appdialog {
  static void showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text("Loading..."),
          content: Row(
            spacing: 10,
            children: [CircularProgressIndicator(), Text("Loading...")],
          ),
        ),
      ),
    );
  }

  static void showError(BuildContext context, String error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
