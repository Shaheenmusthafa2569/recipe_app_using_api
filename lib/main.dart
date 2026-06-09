import 'package:flutter/material.dart';
import 'package:recipe_app_using_api/view/home.dart';
import 'package:recipe_app_using_api/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mysplashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
