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
      // ensures the modal overlay occupies the height
      // of the screen and doesn't overlap the input fields
      isScrollControlled: true,
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

  // deleting expenses
  void _deleteExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    // info message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Expense Deleted',
        ),
        duration: const Duration(
          seconds: 5,
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // re-inserting the deleted item
              _registeredExpenses.insert(
                expenseIndex,
                expense,
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found, please add some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onDelete: _deleteExpense,
      );
    }

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
            child: mainContent,
          ), // ListView can't be rendered inside a Column widget
        ],
      ),
    );
  }
}
