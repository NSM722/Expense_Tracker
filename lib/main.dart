import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// color scheme - it's common for global variables to begin with 'k'
var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 128, 227, 179),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimary,
            foregroundColor: kColorScheme.onPrimaryContainer,
          )),
      home: const Expenses(),
    ),
  );
}
