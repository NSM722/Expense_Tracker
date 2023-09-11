# Expense Tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### [uuid | Dart package](https://pub.dev/packages/uuid "generate unique ids")

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
