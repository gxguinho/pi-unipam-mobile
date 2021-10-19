import 'package:flutter/cupertino.dart';

class NotesController extends ChangeNotifier{

  static NotesController instance = NotesController();

  List notes = [];

  String aluno = "";
  String nota = "";

  registerNote(context) {
    var noteRegister = {
      "aluno": aluno,
      "note": nota
    };

    notes.add(noteRegister);
    cleanInputs();
    Navigator.pop(context);
    notifyListeners();
  }

  void cleanInputs() {
    aluno = "";
    nota = "";
  }

  void removeItem(value) {
    notes.removeWhere((element) => value == element['name']);
    notifyListeners();
  }
}