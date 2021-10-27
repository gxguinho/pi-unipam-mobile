import 'package:flutter/cupertino.dart';
class ManageCurseController extends ChangeNotifier {

  static ManageCurseController instance = ManageCurseController();
  
  String professor = "";
  String nomeCurso = "";
  String quantAlunos = "";

  List courses = [];

  onChangeText(text, title) {
    if(title == "Nome Curso")  nomeCurso = text;
    if(title == "Quantidade de Alunos") quantAlunos = text;
    if(title == "Professores") professor = text;
  }

  cleanInputs() {
    professor = '';
    nomeCurso = '';
    quantAlunos = '';
  }

  handleRegisterCurse(context) {
    var curse = {
      "professor": professor,
      "nomeCurso": nomeCurso,
      "quantAlunos": quantAlunos
    };

    courses.add(curse);
    cleanInputs();
    Navigator.pop(context);
    notifyListeners();
  }

  handleDeleteCurse(nomeCurso, context) {
    courses.removeWhere((element) => element['nomeCurso'] == nomeCurso);
    Navigator.pop(context);
    notifyListeners();
  }

  handleEditCurse(nomeCursoEdit, context) {

    List edit = courses.map((e) => e['nomeCurso'] == nomeCursoEdit  ? {
      
        "professor": professor == "" ? e['professor'] : professor,
        "nomeCurso": nomeCurso == "" ? e['nomeCurso'] : nomeCurso,
        "quantAlunos": quantAlunos == "" ? e['quantAlunos'] : quantAlunos
      
    } : e).toList();
    courses = edit;
    notifyListeners();
  }

}