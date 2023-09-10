import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

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

  // adds a modal overlay
  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
          onAddExpense:
              _addExpense), // pass the function as a value for it to be executed
    );
  }

  // adding new expenses
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseModal,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text(
            'The Chart',
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          ), // ListView can't be rendered inside a Column widget
        ],
      ),
    );
  }
}
