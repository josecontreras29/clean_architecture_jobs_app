import 'package:flutter/material.dart';

// ThemeData lightTheme = ThemeData(brightness: Brightness.light);
// ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

ThemeData theme() {
  return ThemeData(
      inputDecorationTheme: _inputDecorationTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      scaffoldBackgroundColor: Colors.grey[200],
      fontFamily: 'Montserrat',
      appBarTheme: _appBarTheme());
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
      color: Colors.blue[700]!,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.amber),
      titleTextStyle: const TextStyle(color: Colors.green));
}

ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.blue[700]!,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10)));
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.blue[700]!, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 2)),
      isDense: true,
      border: InputBorder.none,
      suffixIconColor: Colors.grey);
}
