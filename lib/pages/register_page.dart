// lib/pages/register_page.dart

import 'package:flutter/material.dart';
import '../services/appwrite_service.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final service = AppwriteService();

  String error = '';

  void register() async {
    final user = await service.register(emailCtrl.text, passwordCtrl.text, nameCtrl.text);
    if (user != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
    } else {
      setState(() => error = 'Registrasi gagal. Email mungkin sudah terdaftar.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Nama')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: passwordCtrl, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: register, child: const Text('Daftar')),
            if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
