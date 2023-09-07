import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Macedonia',
      amount: 70.30,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'DeutschAkademie',
      amount: 145.29,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            'The chart',
          ),
          Text(
            'Expenses list..',
          ),
        ],
      ),
    );
  }
}
