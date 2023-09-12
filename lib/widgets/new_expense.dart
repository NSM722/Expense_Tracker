import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd(); // utility object for formatting dates

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // TextEditingController() object that handles user input
  final _expenseTitleController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );

    final chosenDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = chosenDate;
    });
  }

  void _onSubmit() {
    final enteredAmount = double.tryParse(_expenseAmountController
        .text); // converts the string and returns null if value is invalid
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_expenseTitleController.text.trim().isEmpty ||
        isAmountInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text(
              'Invalid Input',
            ),
            content: const Text(
              'Please enter valid inputs',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text(
                  'Okay',
                ),
              ),
            ],
          );
        },
      );
      return; // any code after the showDialog won't be executed
    }

    // this widget keyword gives access to the connected class
    widget.onAddExpense(
      Expense(
        title: _expenseTitleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context); // close the modal overlay onSubmit
  }

  @override
  void dispose() {
    // communicating to flutter that this
    // controller isn't needed anymore
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            key: const ValueKey('expenseTitle'),
            controller: _expenseTitleController, // set the controller
            maxLength: 60, // max length of characters to type
            decoration: const InputDecoration(
              label: Text(
                'Expense Title',
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  key: const ValueKey('expenseAmount'),
                  controller: _expenseAmountController,
                  keyboardType:
                      TextInputType.number, // allow only number inputs
                  decoration: const InputDecoration(
                    prefixText: 'Kshs. ',
                    label: Text(
                      'Expense Amount',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      key: const ValueKey('addBtn'),
                      onPressed: _showDatePicker,
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                key: const ValueKey('categoryDropDown'),
                value:
                    _selectedCategory, // ensure current selected value is shown onb the screen
                items: Category.values
                    .map(
                      (item) => DropdownMenuItem(
                        value:
                            item, // this value is stored in the onChange func
                        child: Text(
                          item.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(), // display all values in the enum as a dropdown list
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selectedCategory = value;
                  });
                },
              ),
              ElevatedButton(
                key: const ValueKey('saveExpenseBtn'),
                onPressed: _onSubmit,
                child: const Text('Save Expense'),
              ),
              TextButton(
                key: const ValueKey('cancelBtn'),
                onPressed: () {
                  Navigator.pop(context); // closes the overlay
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
