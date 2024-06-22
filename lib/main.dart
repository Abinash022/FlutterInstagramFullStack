import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/Constant/pallete.dart';
import 'package:instagram_clone_flutter/Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.bgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.bgColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
