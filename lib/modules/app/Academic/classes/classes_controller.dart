import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ClassesController extends ChangeNotifier {
  static ClassesController instance = new ClassesController();

  List classOpen = [];
  List classClosed = [];

  String nomeTurma= "";
  String curso= "";
  String quantidadeAluno= "";
  String anoAtual= "";
  String prevInicio= "";
  String prevTermino= "";
  String alunos= "";

  onChangedTextOpen(text, title) {
    if (title == "Nome da turma") nomeTurma = text;
    if (title == "Curso") curso = text;
    if (title == "Quantidade de alunos") quantidadeAluno = text;
    if (title == "Ano Atual") anoAtual = text;
    if (title == "Previsão de início") prevInicio = text;
    if (title == "Previsão de término") prevTermino = text;
    if (title == "Alunos") alunos= text;
  }

  cleanInputsOpen() {
    nomeTurma= "";
    curso= "";
    quantidadeAluno= "";
    anoAtual= "";
    prevInicio= "";
    prevTermino= "";
    alunos= "";
  }

  registerOpenClass(context) {
    var openClassFormatted = 
      {
        "id": new Random().nextInt(100),
        "nomeTurma": nomeTurma,
        "date": DateTime.now()
      };
    classOpen.add(openClassFormatted);
    notifyListeners();
    cleanInputsOpen();
    Navigator.pop(context);
  }

  registerClosedClass(id, nomeTurmaClosed, dateClosed) {
    classOpen.removeWhere((element) => element['id'] == id);
    var closedClassFormatted = {
        "id": new Random().nextInt(100),
        "nomeTurma": nomeTurmaClosed,
        "date": DateFormat("dd/MM/yyyy").format(dateClosed),
        "dateFinalizacao": DateTime.now()
    };
    classClosed.add(closedClassFormatted);
    notifyListeners();
  }

  deleteClass(id) {
    classOpen.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }
}