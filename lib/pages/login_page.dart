// lib/pages/login_page.dart

import 'package:flutter/material.dart';
import '../services/appwrite_service.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final service = AppwriteService();

  String error = '';

  void login() async {
    final session = await service.login(emailCtrl.text, passwordCtrl.text);
    if (session != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      setState(() => error = 'Login gagal. Cek email & password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: passwordCtrl, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterPage())),
              child: const Text('Belum punya akun? Daftar di sini'),
            ),
            if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
