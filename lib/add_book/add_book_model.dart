import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBook() async {
    if (this.bookTitle.isEmpty) {
      throw 'タイトルを入力してください。';
    }

    Firestore.instance.collection('books').add({'title': this.bookTitle});
  }

  Future updateBook(Book book) async {
    final doc =
        Firestore.instance.collection('books').document(book.documentID);
    doc.updateData({
      'title': bookTitle,
      'updateAt': Timestamp.now(),
    });
  }
}
