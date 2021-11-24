import 'dart:math';

import 'package:flutter/cupertino.dart';

class NotesController extends ChangeNotifier {
  static NotesController instance = new NotesController();

  List note = [];
  List noteFiltered = [];

  String nomeAtividade = "";
  String dataAtividade = "";

  noteFilter(modulo) {
    noteFiltered = note.where((element) => element["modulo"] == modulo).toList();
    notifyListeners();
  }

  onChangedText(text, title) {
    if (title == "Nome da atividade") nomeAtividade = text;
    if (title == "Data da atividade") dataAtividade = text;
  }

  cleanInputs() {
     nomeAtividade = "";
     dataAtividade = "";
  }

  registerNote(context, modulo) {
    var noteRegister = {
      "id": new Random().nextInt(100),
      "name": nomeAtividade,
      "date": dataAtividade,
      "modulo": modulo,
    };

    note.add(noteRegister);
    Navigator.popAndPushNamed(context, "/notes");
    notifyListeners();
  }

  deleteNote(id) {
    note.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }
}