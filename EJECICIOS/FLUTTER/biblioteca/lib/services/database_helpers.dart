import 'package:biblioteca/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference librosCollection = _firestore.collection(
    'Libros',
  );

  Future<void> insertBook(Book book) async {
    await librosCollection.add(book.toMap());
  }

  Future<List<Book>> getBooks() async {
    final snapshot = await librosCollection.get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;

      return Book(
        id: doc.id,
        title: data['titulo'] ?? '',
        author: data['autor'] ?? '',
        status: data['estado'] ?? '',
        note: data['nota'] ?? '',
      );
    }).toList();
  }

  Future<void> updateBook(Book book) async {
    await librosCollection.doc(book.id).update(book.toMap());
  }

  Future<void> deleteBook(String id) async {
    await librosCollection.doc(id).delete();
  }
}
