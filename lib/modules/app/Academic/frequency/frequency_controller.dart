import 'package:flutter/cupertino.dart';
class FrequencyController extends ChangeNotifier {

  static FrequencyController instance = FrequencyController();
  
  List frequency = [
    {"aluno":"gabriel","aula": 20, "presenca": 10, "faltas": 30, 'frequencia': '20%'},
    {"aluno":"lucao","aula": 40, "presenca": 23, "faltas": 1, 'frequencia': '60%'},
    {"aluno":"jose","aula": 60, "presenca": 3, "faltas": 12, 'frequencia': '40%'},
  ];

  List frequencyFillter = [];

  String filter = "";

  onChangedText(filter) {
    filter = filter;

   frequencyFillter = frequency.where((element) => filter == element['aluno']).toList();
   notifyListeners();
  }
}