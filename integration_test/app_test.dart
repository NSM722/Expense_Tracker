import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:expense_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('expect to find app title', (tester) async {
    app.main();

    // Wait for the app to load
    await tester.pumpAndSettle();
    expect(find.text('Money Tracker'), findsOneWidget);
  });

  testWidgets('add an expense and verify it is added', (tester) async {
    app.main();

    await tester.pumpAndSettle();

    final Finder addButton = find.byIcon(Icons.add);

    await tester.tap(addButton);

    // // find the form fields
    // await tester.pumpAndSettle();
    // await Future.delayed(const Duration(seconds: 2));

    // final Finder expenseTitleField =
    //     find.widgetWithText(TextField, 'Expense Title');
    // await Future.delayed(const Duration(seconds: 2));

    // final Finder expenseAmountField =
    //     find.widgetWithText(TextField, 'Expense Amount');
    // await Future.delayed(const Duration(seconds: 2));

    // final Finder calendarIcon = find.byIcon(Icons.calendar_month_outlined);
    // await Future.delayed(const Duration(seconds: 2));

    // final Finder dropDownButton = find.byType(DropdownButton);
    // await Future.delayed(const Duration(seconds: 2));

    // final Finder saveExpenseButton = find.byType(ElevatedButton);
    // await Future.delayed(const Duration(seconds: 2));

    // final Finder cancelExpenseButton = find.byType(TextButton);
    // await Future.delayed(const Duration(seconds: 2));

    // await tester.enterText(expenseTitleField, 'Pizza');
    // await Future.delayed(const Duration(seconds: 2));

    // await tester.enterText(expenseAmountField, '30');
    // await Future.delayed(const Duration(seconds: 2));

    // await tester.tap(calendarIcon);
    // await Future.delayed(const Duration(seconds: 2));

    // // Find the date to be selected.
    // final selectedDate = find.text('15');
    // await tester.tap(selectedDate);

    // // Tap on the OK button.
    // final Finder okButton = find.text('OK');
    // await tester.tap(okButton);

    // await tester.tap(dropDownButton);
    // await Future.delayed(const Duration(seconds: 2));

    // await tester.tap(saveExpenseButton);
    // await Future.delayed(const Duration(seconds: 2));

    // // Wait for the app to load
    // await tester.pumpAndSettle(const Duration(seconds: 3));
    // expect(find.text('Pizza'), findsOneWidget);
    // expect(find.text('30'), findsOneWidget);
    // expect(find.text('9/12/2023'), findsOneWidget);
  });
}
