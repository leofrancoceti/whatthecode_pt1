
import 'package:flutter/material.dart';
import '../services/payment_service.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _amountController = TextEditingController();

  void _processPayment() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    PaymentService.startPayment(amount);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pago procesado exitosamente!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Pago')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processPayment,
              child: const Text('Confirmar Pago'),
            ),
          ],
        ),
      ),
    );
  }
}