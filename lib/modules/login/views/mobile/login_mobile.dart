import 'package:flutter/material.dart';
import '../../widgets/login_form.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Gambar Pasar di bagian atas (Tinggi terbatas)
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1533900298318-6b8da08a523e?q=80&w=1000'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form di bagian bawah
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Text("EPOS", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 3)),
                const SizedBox(height: 30),
                const LoginForm(),
                const SizedBox(height: 20),
                TextButton(onPressed: () {}, child: const Text("Buat Akun Baru")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}