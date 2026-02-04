import 'package:flutter/material.dart';
import 'modules/login/views/login_screen.dart'; // Import halaman utama login

void main() {
  runApp(const EposApp());
}

class EposApp extends StatelessWidget {
  const EposApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPOS Mini POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(), // Memanggil file login_screen.dart
    );
  }
}