import 'package:flutter/material.dart';
import 'package:sounds/screens/splash.dart';
import 'package:sounds/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prank Sounds',
      debugShowCheckedModeBanner: false,
      theme: S.darkTheme.copyWith(
        textTheme: S.darkTheme.textTheme.copyWith(),
      ),
      themeMode: ThemeMode.dark,
      home: const SplashPage(),
    );
  }
}
