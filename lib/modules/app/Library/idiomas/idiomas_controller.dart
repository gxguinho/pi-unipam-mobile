import 'package:flutter/cupertino.dart';

class IdiomasController extends ChangeNotifier {
  static IdiomasController instance = IdiomasController();

  List idioma = [];

  String nome = "";
  String dataCriacao = "";

  changedText(text, title) {
    if (title == "Idioma") nome = text;
    if (title == "Data Criação") dataCriacao = text;
  }

  registerIdioma(context) {
    var idiomaRegister = {"nome": nome, "data criação": DateTime.now()};

    idioma.add(idiomaRegister);
    cleanInputs();
    Navigator.pop(context);
    notifyListeners();
  }

  void cleanInputs() {
    nome = "";
  }

  void removeItem(value) {
    idioma.removeWhere((element) => value == element['name']);
    notifyListeners();
  }

  List studentsFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    studentsFillter = filter == ""
        ? idioma
        : idioma.where((element) => filter == element['nome']).toList();
    notifyListeners();
  }
}
