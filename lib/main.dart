import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// color scheme - it's common for global variables to begin with 'k'
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 128, 227, 179),
);

var kDarkModeScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 34, 65, 44),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (fn) {
      runApp(
        MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
              useMaterial3: true,
              colorScheme: kDarkModeScheme,
              cardTheme: const CardTheme().copyWith(
                color: kDarkModeScheme.secondaryContainer,
                margin: const EdgeInsets.all(12),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkModeScheme.primaryContainer,
                  foregroundColor: kDarkModeScheme.onPrimaryContainer,
                ),
              )),
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: kColorScheme,
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.onPrimary,
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
                      fontWeight: FontWeight.bold,
                      color: kColorScheme.onSecondaryContainer,
                      fontSize: 16,
                    ),
                  )),
          // themeMode: ThemeMode.system, // control the theme mode which is default
          home: const Expenses(),
        ),
      );
    },
  );
}
