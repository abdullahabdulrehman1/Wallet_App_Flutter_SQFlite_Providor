// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExpenseModel {
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
  Map<String, dynamic> toMap() => {
        'title': title,
        'id': id,
        'amount': amount,
        'date': date,
        'category': category
      };
  factory ExpenseModel.fromString(Map<String, dynamic> value) => ExpenseModel(
      id: value['id'],
      title: value['title'],
      amount: double.parse(value['amount']),
      date: DateTime.parse(value['date']),
      category: value['category']);
}
