import 'package:flutter/material.dart';

class AbsensiView extends StatelessWidget {
  const AbsensiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3498db),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: const Text("Absensi", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Area Ambil Gambar
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(Icons.camera_alt_outlined, size: 80, color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    const Text(
                      "Silahkan absensi dengan ambil gambar disini",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Tombol Masuk & Keluar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _actionButton("IN / MASUK", const Color(0xFF3498db), Colors.white),
                const SizedBox(width: 20),
                _actionButton("OUT / KELUAR", Colors.white, const Color(0xFF3498db), isOutline: true),
              ],
            ),
            const SizedBox(height: 40),
            // Riwayat Kehadiran
            _buildRiwayatSection(context),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(String label, Color bg, Color text, {bool isOutline = false}) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          elevation: 0,
          side: isOutline ? const BorderSide(color: Color(0xFF3498db)) : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label, style: TextStyle(color: text, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildRiwayatSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Riwayat Kehadiran", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          _riwayatCard("01", "Sen", "--", "--"),
          const SizedBox(height: 10),
          _riwayatCard("02", "Sel", "08:00", "17:00"),
        ],
      ),
    );
  }

  Widget _riwayatCard(String tgl, String hari, String masuk, String pulang) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // Tanggal Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Text(tgl, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(hari, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 40),
          _timeCol("Masuk", masuk),
          const SizedBox(width: 40),
          _timeCol("Pulang", pulang),
        ],
      ),
    );
  }

  Widget _timeCol(String label, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 5),
        Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}