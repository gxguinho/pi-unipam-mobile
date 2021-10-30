import 'package:flutter/cupertino.dart';

class HorarioController extends ChangeNotifier{



  static HorarioController instance = HorarioController();
  
  List horariototal = [{'DiaSemana': 'Segunda','Horario1':'18:50-19:40','Horario2':'19:40-20:30','Horario3':'20:40-21:30','Horario4':'21:30-22:20', 'Materia1': '--','Materia2': '--','Materia3': '--','Materia4': '--'},
                      {'DiaSemana': 'Terça','Horario1':'18:50-19:40','Horario2':'19:40-20:30','Horario3':'20:40-21:30','Horario4':'21:30-22:20', 'Materia1': '--','Materia2': '--','Materia3': '--','Materia4': '--'}
                      ,{'DiaSemana': 'Quarta','Horario1':'18:50-19:40','Horario2':'19:40-20:30','Horario3':'20:40-21:30','Horario4':'21:30-22:20','Materia1': '--','Materia2': '--','Materia3': '--','Materia4': '--'}
                      ,{'DiaSemana': 'Quinta','Horario1':'18:50-19:40','Horario2':'19:40-20:30','Horario3':'20:40-21:30','Horario4':'21:30-22:20', 'Materia1': '--','Materia2': '--','Materia3': '--','Materia4': '--'}
                       ,{'DiaSemana': 'Sexta','Horario1':'18:50-19:40','Horario2':'19:40-20:30','Horario3':'20:40-21:30','Horario4':'21:30-22:20', 'Materia1': '--','Materia2': '--','Materia3': '--','Materia4': '--'}
                      ];

  String dia = '';
  String materia = '';
  String horario ='';  


  onChangeText(text, title){
    if("Materia" == title) materia = text;
    if("Dia da Semana" == title) dia = text;
    if( "Horário" == title) horario = text;
  }

  handleResgistreHorario(){
    List edit = horariototal.map((e) => e['DiaSemana'] == dia && (e['Horario1'] == horario || e['Horario2'] == horario || e['Horario3'] == horario || e['Horario4'] == horario)?  {

        "Materia": materia == "" ? e['Materia'] : materia,
        "DiaSemana": e['DiaSemana'],
        "Horario1": e['Horario1'],
        "Horario2": e['Horario2'],
        "Horario3": e['Horario3'],
        "Horario4": e['Horario4'],
        "Materia1": horario == e['Horario1'] ? materia : e['Materia1'],
        "Materia2": horario == e['Horario2'] ? materia : e['Materia2'],
        "Materia3": horario == e['Horario3'] ? materia : e['Materia3'],
        "Materia4": horario == e['Horario4'] ? materia : e['Materia4'],
        

        
 
    } : e).toList();
    horariototal = edit;
    notifyListeners();
  }

  }


  