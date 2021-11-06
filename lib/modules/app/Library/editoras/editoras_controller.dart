import 'package:flutter/cupertino.dart';

class EditorasController extends ChangeNotifier {
  static EditorasController instance = EditorasController();

  List editoras = [];

  String nome = "";
  String dataCriacao = "";

  changedText(text, title) {
    if (title == "Nome") nome = text;
    if (title == "Data Criação") dataCriacao = text;
  }

  registerEditoras(context) {
    var readersEditoras = {"nome": nome, "data criação": DateTime.now()};

    editoras.add(readersEditoras);
    cleanInputs();
    Navigator.pop(context);
    notifyListeners();
  }

  void cleanInputs() {
    nome = "";
  }

  void removeItem(value) {
    editoras.removeWhere((element) => value == element['name']);
    notifyListeners();
  }

  List studentsFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    studentsFillter = filter == ""
        ? editoras
        : editoras.where((element) => filter == element['nome']).toList();
    notifyListeners();
  }
}
