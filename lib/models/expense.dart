import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd(); // utility object for formatting dates

const uuid = Uuid();

// fixed set of values/custom type
//the values in the enum are treated as strings
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight_land_rounded,
  Category.leisure: Icons.beach_access,
  Category.work: Icons.work_history
};

// data structure of expense objects
class Expense {
  // constructor function with named parameters
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // initializer list generating unique ids

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // getter
  String get formattedDate {
    return formatter.format(date); // returns a readable date format
  }
}

// Model tied to a specific Category
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // defining an additional alternative constructor function
  // filters out expenses belonging to a particular category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
