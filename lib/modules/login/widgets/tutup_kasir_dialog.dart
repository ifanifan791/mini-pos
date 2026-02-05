import 'package:flutter/material.dart';

class TutupKasirDialog extends StatelessWidget {
  const TutupKasirDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const TutupKasirDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: EdgeInsets.zero,
      title: _buildHeader(context),
      content: SizedBox(
        width: 500, // Lebar sesuai mockup laporan
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTimeInfo(),
            const SizedBox(height: 20),
            _buildReportRow("Modal Awal", "Rp 200.000"),
            _buildReportRow("Tunai", "Rp 38.000"),
            _buildReportRow("Non-Tunai", "Rp 150.000"),
            _buildReportRow("Total Penerimaan Kasir", "Rp 38.000"),
            _buildReportRow("Kas Laci", "Rp 38.000"),
            const Divider(thickness: 1, height: 30),
            _buildReportRow("Saldo Akhir", "Rp 238.000", isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                "Laporan Tutup Kasir • Slamet",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Logika untuk proses tutup kasir permanen
              Navigator.pop(context, true); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3498db),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Tutup Kasir", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _timeDetail("Waktu Buka Kasir", "23 Januari 2026, 07.30"),
        _timeDetail("Waktu Tutup Kasir", "23 Januari 2026, 14.30"),
      ],
    );
  }

  Widget _timeDetail(String label, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        Text(time, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildReportRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}