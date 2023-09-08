import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // TextEditingController() object that handles user input
  final _expenseTitleController = TextEditingController();

  @override
  void dispose() {
    // communicating to flutter that this
    // controller isn't needed anymore
    _expenseTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _expenseTitleController, // set the controller
            maxLength: 60, // max length of characters to type
            decoration: const InputDecoration(
              label: Text('Expense Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(
                    _expenseTitleController.text,
                  );
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
