import 'package:flutter/material.dart';
import 'share_invoice_dialog.dart';

class InvoiceSuccessDialog extends StatelessWidget {
  final bool isTunai;
  const InvoiceSuccessDialog({super.key, required this.isTunai});

  static Future<void> show(BuildContext context, {required bool isTunai}) {
    return showDialog(
      context: context,
      barrierColor: const Color(0xFF3498db).withOpacity(0.9), // Background Biru
      builder: (context) => InvoiceSuccessDialog(isTunai: isTunai),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Sukses
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF2ecc71),
            child: Icon(Icons.check, color: Colors.white, size: 50),
          ),
          const SizedBox(height: 15),
          const Text("Transaksi Berhasil", 
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          
          // Kertas Struk Putih
          Container(
            width: 450,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Text("Total Tagihan", style: TextStyle(color: Colors.grey)),
                const Text("57.000", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                
                _rowItem("Barang", "Harga", isHeader: true),
                const Divider(),
                _rowItem("Americano", "Rp 10.000"),
                _rowItem("Machiatto", "Rp 35.000"),
                _rowItem("Korek Cricket", "Rp 12.000"),
                const SizedBox(height: 10),
                const Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                const SizedBox(height: 10),
                
                _rowSummary("Total", "Rp 57.000"),
                
                // Bagian khusus Tunai (Cash)
                if (isTunai) ...[
                  _rowSummary("Tunai", "Rp 100.000"),
                  const Divider(),
                  _rowSummary("Kembalian", "Rp 43.000", color: Colors.black),
                ],
                
                const SizedBox(height: 40),
                
                // Tombol Aksi
                Row(
                  children: [
                    Expanded(child: _outlinedBtn("Bagikan Struk", () => ShareInvoiceDialog.show(context))),
                    const SizedBox(width: 10),
                    Expanded(child: _outlinedBtn("Cetak", () {})),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3498db)),
                    child: const Text("Selesai", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowItem(String label, String value, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal, color: isHeader ? Colors.black : Colors.black87)),
          Text(value, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _rowSummary(String label, String value, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
        ],
      ),
    );
  }

  Widget _outlinedBtn(String label, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF3498db))),
      child: Text(label, style: const TextStyle(color: Color(0xFF3498db))),
    );
  }
}