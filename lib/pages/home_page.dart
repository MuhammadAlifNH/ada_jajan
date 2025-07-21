// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import '../services/appwrite_service.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) async {
    final service = AppwriteService();
    await service.logout();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda'), actions: [
        IconButton(onPressed: () => logout(context), icon: const Icon(Icons.logout))
      ]),
      body: const Center(child: Text('Selamat datang di Ada Jajan!')),
    );
  }
}
