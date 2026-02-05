import 'package:flutter/material.dart';
import 'package:mini_pos_lido/models/product_model.dart';
import 'package:mini_pos_lido/modules/login/widgets/buka_kasir_dialog.dart';
import 'package:mini_pos_lido/modules/login/widgets/tutup_kasir_dialog.dart';
import 'package:mini_pos_lido/modules/login/widgets/payment_method_dialog.dart';
import 'package:mini_pos_lido/modules/login/widgets/pilih_pelanggan_dialog.dart';
import 'package:mini_pos_lido/modules/login/views/absensi.dart';

class KasirTabletView extends StatefulWidget {
  const KasirTabletView({super.key});

  @override
  State<KasirTabletView> createState() => _KasirTabletViewState();
}

class _KasirTabletViewState extends State<KasirTabletView> {
  bool isKasirOpen = false;

  // Dummy data produk sesuai grid di gambar
  final List<Product> products = [
    Product(name: "Americano", price: "Rp 15.000", initial: "A"),
    Product(name: "Kentang", price: "Rp 20.000", initial: "K"),
    Product(name: "Teh", price: "Rp 5.000", initial: "T"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar Biru dengan profil user
      appBar: AppBar(
        backgroundColor: const Color(0xFF3498db),
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?u=slamet',
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Slamet",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
      // Drawer samping sesuai menu sidebar
      drawer: _buildSidebar(context),
      body: Row(
        children: [
          // 1. Sidebar Kategori (Sisi Kiri)
          _buildCategoryList(),

          // 2. Area Utama: Search & Grid Produk (Tengah)
          Expanded(flex: 3, child: _buildMainContent()),

          // 3. Ringkasan Belanja (Sisi Kanan)
          _buildCartSection(),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?u=slamet',
              ),
            ),
            accountName: const Text(
              "Slamet",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "Owner/Staff",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          _sidebarItem(Icons.point_of_sale, "Penjualan", isActive: true),
          _sidebarItem(Icons.shopping_bag_outlined, "Pembelian"),
          _sidebarItem(Icons.bar_chart, "Laporan"),
          _sidebarItem(Icons.inventory_2_outlined, "Inventori"),
          _sidebarItem(Icons.payment, "Payment"),
          _sidebarItem(
            Icons.access_time,
            "Absensi",
            onTap: () {
              Navigator.pop(context); // Tutup drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AbsensiView()),
              );
            },
          ),
          _sidebarItem(
            isKasirOpen ? Icons.lock_clock : Icons.storefront,
            isKasirOpen ? "Tutup Kasir" : "Buka Kasir",
            onTap: () async {
              Navigator.pop(context); // Tutup Drawer

              if (!isKasirOpen) {
                // Jika kasir tutup, buka dialog Buka Kasir
                await BukaKasirDialog.show(context);
                setState(() => isKasirOpen = true);
              } else {
                // Jika kasir buka, tampilkan Laporan Tutup Kasir
                bool? confirmClose = await showDialog(
                  context: context,
                  builder: (context) => const TutupKasirDialog(),
                );

                if (confirmClose == true) {
                  setState(() => isKasirOpen = false);
                }
              }
            },
          ),
          _sidebarItem(Icons.person_outline, "Pengeluaran"),
        ],
      ),
    );
  }

  Widget _sidebarItem(
    IconData icon,
    String title, {
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF3498db) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.white : Colors.grey),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontSize: 14,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = [
      "Favorit",
      "Produk Paket",
      "Promo",
      "Deposit",
      "HARDWARE",
      "Frozen",
    ];
    return Container(
      width: 160,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  "Kategori Produk",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Spacer(),
                Icon(Icons.filter_list, size: 18),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  categories[index],
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: "Cari...",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.qr_code_scanner),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(height: 20),
          // Grid Produk
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.85,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => _productCard(products[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  product.initial,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.price,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartSection() {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          // Tombol Tambah Pelanggan
          // Di dalam Widget _buildCartSection
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              onPressed: () =>
                  PilihPelangganDialog.show(context), // Panggil dialog
              icon: const Icon(Icons.add, size: 20),
              label: const Text("Pelanggan"),
            ),
          ),
          const Divider(height: 1),
          // List Item di Keranjang
          Expanded(
            child: ListView(
              children: [
                _cartTile("Americano", "2", "Rp 30.000"),
                _cartTile("Kentang", "1", "Rp 20.000"),
              ],
            ),
          ),
          // Footer: Kode Redeem & Tombol Bayar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Kode Reedem",
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => PaymentMethodDialog.show(
                      context,
                    ), // Panggil dialog metode bayar
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3498db),
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bayar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp 50.000 >",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartTile(String title, String qty, String price) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        price,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.remove_circle_outline, size: 22, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              qty,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(Icons.add_circle_outline, size: 22, color: Colors.grey),
        ],
      ),
    );
  }
}
