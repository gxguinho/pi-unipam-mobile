import 'dart:math';

import 'package:flutter/cupertino.dart';

class ModulesController extends ChangeNotifier {
  static ModulesController instance = new ModulesController();

  List modules = [];

  String name = "";
  String cargaHoraria = "";
  String professor = "";

  onChangedText(text, title) {
    if (title == "Nome do módulo") name = text;
    if (title == "Carga horária") cargaHoraria = text;
    if (title == "Professor") professor = text;
  }

  cleanInputs() {
    name = "";
    cargaHoraria = "";
    professor = "";
  }

  registerModule(context) {
    var moduleRegister = {
      "id": new Random().nextInt(100),
      "name": name,
      "date": DateTime.now(),
      "carga": cargaHoraria,
      "professor": professor
    };

    modules.add(moduleRegister);
    Navigator.pop(context);
    notifyListeners();
  }

  deleteModule(id) {
    modules.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }
}