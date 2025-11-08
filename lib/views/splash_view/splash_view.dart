import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static const String routeName = 'tasky';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Tasky')));
  }
}
