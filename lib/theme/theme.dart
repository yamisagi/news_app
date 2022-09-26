import 'package:flutter/material.dart';

class ProductTheme {
  static final ThemeData darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
