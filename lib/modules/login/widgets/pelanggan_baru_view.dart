import 'package:flutter/material.dart';

class PelangganBaruView extends StatefulWidget {
  const PelangganBaruView({super.key});

  @override
  State<PelangganBaruView> createState() => _PelangganBaruViewState();
}

class _PelangganBaruViewState extends State<PelangganBaruView> {
  int _genderValue = 1; // 1: Laki-laki, 2: Perempuan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3498db),
        title: const Text("Pelanggan Baru", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6, // Gunakan 60% lebar layar tablet
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildField("ID Pelanggan", initialValue: "T09173619736", isReadOnly: true),
                _buildField("Nama Pelanggan", hint: "Contoh: Andi"),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Jenis Kelamin", style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),
                Row(
                  children: [
                    Radio(value: 1, groupValue: _genderValue, onChanged: (v) => setState(() => _genderValue = v as int)),
                    const Text("Laki - Laki"),
                    const SizedBox(width: 20),
                    Radio(value: 2, groupValue: _genderValue, onChanged: (v) => setState(() => _genderValue = v as int)),
                    const Text("Perempuan"),
                  ],
                ),

                _buildField("Email", hint: "Contoh: nama@gmail.com"),
                
                const Text("No WA", style: TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 60, height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text("+62")),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: _buildField("", hint: "Contoh: 851022929023", hideLabel: true)),
                  ],
                ),

                _buildField("Alamat", hint: "Masukkan alamat lengkap", maxLines: 3),
                
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3498db),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("SIMPAN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, {String? hint, String? initialValue, bool isReadOnly = false, int maxLines = 1, bool hideLabel = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hideLabel) ...[
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 8),
        ],
        TextField(
          readOnly: isReadOnly,
          maxLines: maxLines,
          controller: TextEditingController(text: initialValue),
          decoration: InputDecoration(
            hintText: hint,
            filled: isReadOnly,
            fillColor: isReadOnly ? Colors.grey.shade100 : Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}