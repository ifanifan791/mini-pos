import 'package:flutter/material.dart';
import 'register_tablet.dart';

class LoginTablet extends StatefulWidget {
  const LoginTablet({super.key});

  @override
  State<LoginTablet> createState() => _LoginTabletState();
}

class _LoginTabletState extends State<LoginTablet> {
  // 0: Awal, 1: Form Login, 2: Form Registrasi Toko, 3: Form Registrasi Karyawan
  int _viewState = 0;

  void _showRoleSelection() {
    showDialog(
      context: context,
      barrierColor: Colors.black45, // Background luar jadi gelap transparan
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _roleCard("Daftar Toko", Icons.storefront, () {
                  Navigator.pop(context);
                  setState(() => _viewState = 2);
                }),
                const SizedBox(width: 30),
                _roleCard("Daftar Karyawan", Icons.groups, () {
                  Navigator.pop(context);
                  setState(() => _viewState = 3);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SISI KIRI: Gambar Pasar (Statis)
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1533900298318-6b8da08a523e?q=80&w=1000'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SISI KANAN: Area Putih
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: _buildDynamicContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicContent() {
    if (_viewState == 0) return _buildInitialView();
    
    // Header Back Button untuk Form
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => _viewState = 0),
              ),
              const SizedBox(width: 10),
              Text(
                _viewState == 1 ? "LOGIN" : (_viewState == 2 ? "DAFTAR TOKO" : "DAFTAR KARYAWAN"),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        Expanded(
          child: _viewState == 1 ? _buildLoginForm() : RegisterContent(type: _viewState),
        ),
      ],
    );
  }

  Widget _buildInitialView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppLogoWidget(),
          const SizedBox(height: 60),
          _largeButton("MASUK", const Color(0xFF3498db), Colors.white, () => setState(() => _viewState = 1)),
          const SizedBox(height: 20),
          _largeButton("BUAT AKUN", Colors.white, const Color(0xFF3498db), _showRoleSelection, isOutline: true),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Column(
        children: [
          const AppLogoWidget(),
          const SizedBox(height: 40),
          _inputField("Username"),
          _inputField("Password", isPassword: true),
          Row(
            children: [
              Checkbox(value: false, onChanged: (v) {}),
              const Text("Remember Me", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 30),
          _largeButton("MASUK", const Color(0xFF3498db), Colors.white, () {}),
        ],
      ),
    );
  }

  // --- Widget Helpers ---
  Widget _largeButton(String label, Color bg, Color text, VoidCallback onTap, {bool isOutline = false}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          elevation: isOutline ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: isOutline ? const BorderSide(color: Color(0xFF3498db)) : BorderSide.none,
          ),
        ),
        child: Text(label, style: TextStyle(color: text, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _roleCard(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200, height: 180,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 15),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo persis gambar mockup
        Image.network('https://i.ibb.co/L6Z4XqQ/epos-logo.png', height: 150, errorBuilder: (c, e, s) => const CircleAvatar(radius: 60, child: Text("E"))),
        const Text("EPOS", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 5)),
      ],
    );
  }
}