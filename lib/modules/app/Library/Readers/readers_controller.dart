import 'package:flutter/cupertino.dart';

class ReadersController extends ChangeNotifier {
  static ReadersController instance = ReadersController();

  List readers = [];

  String nome = "";

  registerReaders(context) {
    var readersRegister = {
      "nome": nome,
    };

    readers.add(readersRegister);
    cleanInputs();
    Navigator.pop(context);
    notifyListeners();
  }

  void cleanInputs() {
    nome = "";
  }

  void removeItem(value) {
    readers.removeWhere((element) => value == element['name']);
    notifyListeners();
  }

  List studentsFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    studentsFillter = filter == ""
        ? readers
        : readers.where((element) => filter == element['nome']).toList();
    notifyListeners();
  }
}
