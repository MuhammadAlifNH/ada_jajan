import 'package:appwrite/appwrite.dart';

class AppwriteService {
  late Client client;
  late Account account;
  late Databases databases;

  AppwriteService() {
    client = Client()
      ..setEndpoint('https://cloud.appwrite.io/v1') // Ganti kalau kamu pakai self-host
      ..setProject('684be6f1001fb498c3b6')               // Ganti dengan ID project kamu

      ..setSelfSigned(status: true); // hanya jika self-host

    account = Account(client);
    databases = Databases(client);
  }
}
