// services/payment_service.dart
class PaymentService {
  static List<Map<String, dynamic>> _transactions = [];

  static Future<void> startPayment(double amount) async {
    _transactions.add({
      'id': DateTime.now().toString(),
      'amount': amount,
      'status': 'Completado',
      'date': DateTime.now(),
    });
  }

  static List<Map<String, dynamic>> getHistory() {
    return _transactions;
  }

  static bool validatePayment(String transactionId) {
    return _transactions.any((t) => t['id'] == transactionId);
  }
}