
class Transaction {
  final String id;
  final double amount;
  final String status;
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.status,
    required this.date,
  });
}