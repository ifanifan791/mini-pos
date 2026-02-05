import 'package:flutter/material.dart';

class RegisterContent extends StatelessWidget {
  final int type; // 2: Toko, 3: Karyawan
  const RegisterContent({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
      child: Column(
        children: [
          // Logo Reusable
          Image.network('https://i.ibb.co/L6Z4XqQ/epos-logo.png', height: 120, errorBuilder: (c, e, s) => const CircleAvatar(radius: 50, child: Text("E"))),
          const Text("EPOS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 4)),
          const SizedBox(height: 40),
          
          // Form Fields sesuai gambar mockup
          if (type == 3) ...[
            _buildField("ID Toko"),
            _buildField("Nama Lengkap"),
            _buildField("Email"),
            _buildField("No HP"),
          ] else ...[
            _buildField("Nama Lengkap"),
            _buildField("Nama Toko"),
            _buildField("Pilih Lokasi Toko", icon: Icons.location_on_outlined),
            _buildField("Alamat Lengkap", maxLines: 3),
          ],
          
          const SizedBox(height: 30),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildField(String hint, {IconData? icon, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue, size: 20) : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3498db),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text("DAFTAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}