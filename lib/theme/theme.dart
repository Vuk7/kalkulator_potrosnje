import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        background: Color.fromRGBO(248, 224, 224, 1),
        primary: Color.fromRGBO(174, 110, 236, 1),
        secondary: Color.fromRGBO(250, 86, 156, 1)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        background: Color.fromRGBO(22, 22, 22, 1),
        primary: Color.fromRGBO(174, 110, 236, 1),
        secondary: Color.fromRGBO(250, 86, 156, 1)));
