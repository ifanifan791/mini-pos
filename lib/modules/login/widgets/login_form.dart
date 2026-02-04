import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Username',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Checkbox(value: false, onChanged: (v) {}),
            const Text("Remember Me"),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3498db),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
            child: const Text("MASUK", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}