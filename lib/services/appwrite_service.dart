// lib/services/appwrite_service.dart

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  late Client client;
  late Account account;

  AppwriteService() {
    client = Client()
      ..setEndpoint('https://cloud.appwrite.io/v1') // Ganti sesuai backend kamu
      ..setProject('684be6f1001fb498c3b6'); // Ganti dengan Project ID kamu

    account = Account(client);
  }

  Future<User?> register(String email, String password, String name) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return user;
    } catch (e) {
      print('Register error: $e');
      return null;
    }
  }

  Future<Session?> login(String email, String password) async {
    try {
      final session = await account.createEmailSession(
        email: email,
        password: password,
      );
      return session;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSessions();
    } catch (e) {
      print('Logout error: $e');
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return await account.get();
    } catch (_) {
      return null;
    }
  }
}
