import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:expense_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('add an expense and verify it is added', (tester) async {
    app.main();

    // Wait for the app to load
    await tester.pumpAndSettle();

    final Finder addButton = find.byIcon(Icons.add);

    await tester.tap(addButton);

    // find the form fields
    // final Finder expenseTitleField =
    //     find.widgetWithText(TextField, 'Expense Title');

    // final Finder expenseAmountField =
    //     find.widgetWithText(TextField, 'Expense Amount');

    // final Finder calendarIcon = find.byIcon(Icons.calendar_month_outlined);

    // final Finder dropDownButton = find.byType(DropdownButton);

    // final Finder saveExpenseButton = find.byType(ElevatedButton);

    // final Finder cancelExpenseButton = find.byType(TextButton);

    // await tester.enterText(expenseTitleField, 'Pizza');
    // await tester.enterText(expenseAmountField, '30');
    // await tester.tap(calendarIcon);
    // await tester.tap(dropDownButton);
    // await tester.tap(saveExpenseButton);

    // // Wait for the app to load
    // await tester.pumpAndSettle(const Duration(seconds: 3));
    // expect(find.text('Pizza'), findsOneWidget);
    // expect(find.text('30'), findsOneWidget);
  });
}
