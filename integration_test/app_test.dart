import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:expense_tracker/main.dart' as app;
// import 'package:intl/intl.dart';

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

    await tester.pumpAndSettle();

    final Finder expenseTitleField =
        find.widgetWithText(TextField, 'Expense Title');
    await Future.delayed(const Duration(seconds: 2));

    final Finder expenseAmountField =
        find.widgetWithText(TextField, 'Expense Amount');
    await tester.pumpAndSettle();

    final Finder calendarIcon = find.byIcon(Icons.calendar_month_outlined);
    await tester.pumpAndSettle();

    final Finder saveExpenseButton = find.byType(ElevatedButton);
    await tester.pumpAndSettle();

    await tester.enterText(expenseTitleField, 'Pizza');
    await tester.pumpAndSettle();

    await tester.enterText(expenseAmountField, '30');
    await tester.pumpAndSettle();

    await tester.tap(calendarIcon);
    await tester.pumpAndSettle();

    // Find the date to be selected.
    final Finder selectedDate = find.text('13');
    await tester.tap(selectedDate);

    // Tap on the OK button.
    final Finder okButton = find.text('OK');
    await tester.tap(okButton);

    await tester.pumpAndSettle();
    final Finder dropDownButton =
        find.byKey(const ValueKey('categoryDropDown'));
    await tester.pumpAndSettle();

    await tester.tap(dropDownButton);
    await tester.pumpAndSettle();

    final Finder selectedCategory = find.text('LEISURE').first;
    await tester.tap(selectedCategory);

    await tester.tap(saveExpenseButton);
    await tester.pumpAndSettle();

    expect(find.text('Pizza'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);

    // final expectedDate = DateFormat('M/d/yyyy').format(DateTime(2023, 9, 13));
    // expect(find.text(expectedDate), findsOneWidget);
  });

  testWidgets('cancel adding an expense and close the modal', (tester) async {
    app.main();

    // Wait for the app to load
    await tester.pumpAndSettle();

    final Finder addButton = find.byIcon(Icons.add);

    await tester.tap(addButton);

    await tester.pumpAndSettle();

    final Finder cancelExpenseButton = find.byKey(const ValueKey('cancelBtn'));
    await tester.tap(cancelExpenseButton);
    await tester.pumpAndSettle();
  });
}
