
import 'appwrite_client.dart';

Future<void> fetchDummyProducts() async {
  final service = AppwriteService();

  try {
    final result = await service.databases.listDocuments(
      databaseId: 'your-database-id',         // Ganti sesuai DB kamu
      collectionId: 'products',               // Koleksi yang sudah kamu buat
    );

    print("Jumlah produk ditemukan: ${result.documents.length}");
    for (var doc in result.documents) {
      print(doc.data['name']);
    }
  } catch (e) {
    print("Error fetch produk: $e");
  }
}
