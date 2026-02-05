import 'package:flutter/material.dart';

class BukaKasirDialog extends StatefulWidget {
  const BukaKasirDialog({super.key});

  @override
  State<BukaKasirDialog> createState() => _BukaKasirDialogState();

  // Helper function untuk memanggil dialog ini dari mana saja
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const BukaKasirDialog(),
    );
  }
}

class _BukaKasirDialogState extends State<BukaKasirDialog> {
  final TextEditingController _saldoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "Buka Kasir",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Kamu bisa tambahkan logika simpan saldo di sini kedepannya
                print("Saldo Awal: ${_saldoController.text}");
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3498db),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Buka Kasir", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Saldo Awal",
              style: TextStyle(
                color: Color(0xFF3498db), 
                fontSize: 13, 
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _saldoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Rp (nominal)",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}