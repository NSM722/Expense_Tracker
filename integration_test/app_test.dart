import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:expense_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('tap the add button', (tester) async {
    app.main();

    expect(find.text('Macedonia'), findsOneWidget);
    expect(find.text('DeutschAkademie'), findsOneWidget);

    final Finder addBtn = find.byIcon(Icons.add);

    await tester.tap(addBtn);
    await tester.pumpAndSettle();
  });
}
