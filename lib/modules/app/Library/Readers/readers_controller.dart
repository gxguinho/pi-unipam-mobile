import 'package:flutter/cupertino.dart';

class ReadersController extends ChangeNotifier {
  static ReadersController instance = ReadersController();

  List readers = [];

  String nome = "";
  String tipo = "";
  String celular = "";
  String dataCriacao = "";

  changedText(text, title) {
    if (title == "Nome") nome = text;
    if (title == "Tipo") tipo = text;
    if (title == "Celular") celular = text;
    if (title == "Data Criação") dataCriacao = text;
  }

  registerReaders(context) {
    var readersRegister = {
      "nome": nome,
      "tipo": tipo,
      "telefone": celular,
      "data criação": DateTime.now()
    };

    notifyListeners();
    readers.add(readersRegister);
    cleanInputs();
    Navigator.pop(context);
  }

  void cleanInputs() {
    nome = "";
  }

  void removeItem(value) {
    readers.removeWhere((element) => value == element['nome']);
    notifyListeners();
  }

  List readersFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    readersFillter = filter == ""
        ? readers
        : readers.where((element) => filter == element['nome']).toList();
    notifyListeners();
  }
}
