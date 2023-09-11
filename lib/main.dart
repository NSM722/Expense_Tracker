import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// color scheme - it's common for global variables to begin with 'k'
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 128, 227, 179),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimary,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(12),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 14,
                ),
              )),
      home: const Expenses(),
    ),
  );
}
