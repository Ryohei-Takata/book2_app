import 'package:flutter/material.dart';
import 'package:flutter_book2_app/add_book/add_book_model.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    return ChangeNotifierProvider<AddBookModel>(
      create: (__) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本の追加'),
        ),
        body: Consumer<AddBookModel>(builder: (context, model, child) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  onChanged: (text) {
                    model.bookTitle = text;
                  },
                ),
                RaisedButton(
                  child: Text('追加する'),
                  onPressed: () async {
                    try {
                      await model.addBook();
                      await showDialog(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('保存しますか？'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      Navigator.of(context).pop();
                    } catch (e) {
                      await showDialog(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(e.toString()),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
