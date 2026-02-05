import 'package:flutter/material.dart';
import 'package:mini_pos_lido/modules/login/widgets/pelanggan_baru_view.dart';

class PilihPelangganDialog extends StatefulWidget {
  const PilihPelangganDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const PilihPelangganDialog(),
    );
  }

  @override
  State<PilihPelangganDialog> createState() => _PilihPelangganDialogState();
}

class _PilihPelangganDialogState extends State<PilihPelangganDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: EdgeInsets.zero,
      title: _buildHeader(),
      content: SizedBox(
        width: 450, // Lebar ideal untuk tablet
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 15),
            _buildPelangganList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          const Text(
            "Pilih Pelanggan",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog dulu
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PelangganBaruView(),
                ),
              );
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text("Pelanggan Baru"),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Cari...",
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildPelangganList() {
    // Simulasi daftar pelanggan sesuai mockup
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 2,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              "Slamet",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "0812983737299  •  WR01234",
              style: TextStyle(fontSize: 12),
            ),
            onTap: () => Navigator.pop(context),
          );
        },
      ),
    );
  }
}
