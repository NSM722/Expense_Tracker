import 'package:uuid/uuid.dart';

const uuid = Uuid();

// fixed set of values/custom type
//the values in the enum are treated as strings
enum Category { food, travel, leisure, work }

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
}
