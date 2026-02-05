import 'package:flutter/material.dart';
import 'invoice_success_dialog.dart';

class PaymentMethodDialog extends StatelessWidget {
  const PaymentMethodDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const PaymentMethodDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Row(
        children: [
          Icon(Icons.close, size: 20),
          SizedBox(width: 10),
          Text("Metode Pembayaran", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _methodItem(context, Icons.payments, "Cash", isTunai: true),
            _methodItem(context, Icons.qr_code_scanner, "QRIS", isTunai: false),
            _methodItem(context, Icons.account_balance, "Transfer", isTunai: false),
          ],
        ),
      ),
    );
  }

  Widget _methodItem(BuildContext context, IconData icon, String label, {required bool isTunai}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Tutup dialog metode
        InvoiceSuccessDialog.show(context, isTunai: isTunai); // Buka Invoice
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87),
            const SizedBox(width: 15),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}