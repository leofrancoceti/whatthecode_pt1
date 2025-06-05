
import 'package:flutter/material.dart';
import '../services/payment_service.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = PaymentService.getHistory();

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Pagos')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final t = transactions[index];
          return ListTile(
            title: Text('\$${t['amount']}'),
            subtitle: Text('${t['date']} - ${t['status']}'),
            trailing: IconButton(
              icon: const Icon(Icons.verified),
              onPressed: () {
                final isValid = PaymentService.validatePayment(t['id']);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(isValid ? 'Válido' : 'Inválido')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}