import 'package:flutter/material.dart';
import 'package:kalkulator_potrosnje/pages/main_page/main_page.dart';
import 'package:kalkulator_potrosnje/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
