import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  String bookText = '私の本一覧';

  void changeBookText() {
    this.bookText = '最高の本棚';
    notifyListeners();
  }
}
