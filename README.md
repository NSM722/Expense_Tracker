# Expense Tracker

Run `flutter run` on the terminal to view the application in web mode or connect to a Mobile device and click `Run` within your IDE

This app tracks day to day expenses and displays the output on a bar chart
![Expense_tracker](https://github.com/NSM722/Expense_Tracker/assets/83452606/3183aee7-e31f-4c2f-8575-cfdc394d10b3)

![expense_tracker_modal](https://github.com/NSM722/Expense_Tracker/assets/83452606/e3341cb1-9b58-476f-99a8-9d9cb38c5a9d)

## Features
 - `Home screen` that displays all the expenses as a scrollable list
 - A `bar chart` to track and show which categories have the highest or lowest expenses
 - The expenses on the home screen are `dismissable` when slid to either the right or left side
 - `Snackbar` displayed at the bottom of the screen to confirm an expense has been deleted, the same `Snackbar` offers the option to undo this action
 - `Action Button` on top right of the the app bar to add a new expense
 - A `Bottom sheet modal` that contains a form to fill out all the new expense details
 - An `alert dialog` to communicate any invalid inputs to the user before submitting the form
 - User is navigated to the home screen upon submitting the form or cancelling action

## Packages

### [uuid | Dart package](https://pub.dev/packages/uuid 'generate unique ids')

### Installation

```terminal
flutter pub add uuid
```

```dart
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  // constructor function with named parameters
  Expense({required this.title, required this.amount, required this.date})
      : id = uuid.v4(); // initializer list generating unique ids
  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
```

### [Flutter package for formatting dates](https://pub.dev/packages/intl/install)

```terminal
flutter pub add intl
```

### Refactoring of the modal bottom sheet

The following class shows a simple example of a TextField Widget

To add a visible label, one needs to add the `decoration` parameter which has the `InputDecoration()` widget that gives way to the `label` attribute

```dart
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 60, // max length of characters to type
            decoration: InputDecoration(
              label: Text('Expense Title'),
            ),
          ),
        ],
      ),
    );
  }
}
```

### Flutter Trees

**Widget Tree** - Combination of widgets

**Element Tree** - In-memory representation of widgets, used for determining necessary UI updates

**Render Tree** - The visible UI building blocks

![flutter_trees](https://github.com/NSM722/Expense_Tracker/assets/83452606/d7ecd89f-13d8-4eb9-a004-e2bf5d6370a6)

### Testing

Type the following command to run all integration tests

```dart
flutter test integration_test
```

To test on a real iOS / Android device, first, connect the device and run the following command from the root of the project

```dart
flutter test integration_test/app_test.dart
```
