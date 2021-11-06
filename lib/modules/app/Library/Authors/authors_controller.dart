import 'package:flutter/cupertino.dart';

class AuthorsController extends ChangeNotifier {
  static AuthorsController instance = AuthorsController();

  List authors = [];

  String nome = "";
  String dataCriacao = "";

  changedText(text, title) {
    if (title == "Nome") nome = text;
    if (title == "Data Criação") dataCriacao = text;
  }

  registerAuthors(context) {
    var authorsRegister = {"nome": nome, "data criação": DateTime.now()};

    notifyListeners();
    authors.add(authorsRegister);
    cleanInputs();
    Navigator.pop(context);
  }

  void cleanInputs() {
    nome = "";
  }

  void removeItem(value) {
    authors.removeWhere((element) => value == element['nome']);
    notifyListeners();
  }

  List authorsFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    authorsFillter = filter == ""
        ? authors
        : authors.where((element) => filter == element['nome']).toList();
    notifyListeners();
  }
}
