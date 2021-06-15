import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBook() async {
    if (this.bookTitle.isEmpty) {
      throw '入力してください。';
    }
    Firestore.instance.collection('books').add({"title": this.bookTitle});
  }
}
