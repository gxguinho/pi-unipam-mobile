import 'package:flutter/cupertino.dart';

class CategoriaController extends ChangeNotifier {
  static CategoriaController instance = CategoriaController();

  List categoria = [];

  String nome = "";
  String dataCriacao = "";

  changedText(text, title) {
    if (title == "Categoria") nome = text;
    if (title == "Data Criação") dataCriacao = text;
  }

  registerCategoria(context) {
    var categoriaRegister = {"nome": nome, "data criação": DateTime.now()};

    categoria.add(categoriaRegister);
    cleanInputs();
    Navigator.pop(context);
    notifyListeners();
  }

  void cleanInputs() {
    nome = "";
  }

  void removeItem(value) {
    categoria.removeWhere((element) => value == element['name']);
    notifyListeners();
  }

  List studentsFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    studentsFillter = filter == ""
        ? categoria
        : categoria.where((element) => filter == element['nome']).toList();
    notifyListeners();
  }
}
