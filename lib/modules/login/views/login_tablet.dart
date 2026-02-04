import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginTablet extends StatelessWidget {
  const LoginTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SISI KIRI: Gambar Pasar (Sesuai Mockup)
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
        // SISI KANAN: Form Login
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 100), // Padding lebar agar form di tengah
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: 50),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          height: 100, width: 100,
          decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: const Center(child: Text("E", style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold))),
        ),
        const SizedBox(height: 10),
        const Text("EPOS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 5)),
      ],
    );
  }
}