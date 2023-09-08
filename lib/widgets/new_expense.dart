import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredExpenseTitle = '';

  void _saveExpenseTitle(String inputValue) {
    // setState method not being used since UI
    // isn't being updated, only a value is being
    //stored on the BG
    _enteredExpenseTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveExpenseTitle,
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
                    _enteredExpenseTitle,
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
