import 'package:flutter/material.dart';

class ShareInvoiceDialog extends StatelessWidget {
  const ShareInvoiceDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const ShareInvoiceDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.close, size: 20)),
              const SizedBox(width: 10),
              const Text("Bagikan Struk", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3498db), padding: const EdgeInsets.symmetric(horizontal: 10)),
            child: const Text("Kirim", style: TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
      content: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: "No Whatsapp",
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}