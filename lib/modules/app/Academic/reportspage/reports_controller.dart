import 'package:flutter/cupertino.dart';

class ReportsController extends ChangeNotifier {
  static ReportsController instance = ReportsController();

  List students = [
    {"aluno": "lucao", "report": ""},
    {"aluno": "jose", "report": ""},
    {"aluno": "daniel", "report": ""},
    {"aluno": "nanda", "report": ""},
    {"aluno": "gago", "report": ""},
    {"aluno": "piabos", "report": ""},
  ];

  String report = "";

  registerReport(context, nomeAluno) {
    List edit = students
        .map((e) => e['aluno'] == nomeAluno
            ? {
                "aluno": e['aluno'],
                "report": report,
              }
            : e)
        .toList();
    students = edit;
    studentsFillter = edit;

    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }

  void cleanInputs() {
    report = "";
  }

  List studentsFillter = [];

  String filter = "";

  onChangedText(text) {
    filter = text;

    studentsFillter = filter == ""
        ? students
        : students.where((element) => filter == element['aluno']).toList();
    notifyListeners();
  }
}
