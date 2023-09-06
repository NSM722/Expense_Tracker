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
