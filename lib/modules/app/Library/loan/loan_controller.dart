import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:unipam_mobile/modules/app/app_controller.dart';

class LoanController extends ChangeNotifier {
  static LoanController instance = new LoanController();


  String tipoRelatorio = "";
  String ano = "";
  String mes = "";


  String token = AppController.instance.token!;
  
  onChangedText(text, title) {
    if (title == "Tipo de Relatório")  tipoRelatorio = text;
    if (title == "Ano")  ano = text;
    if (title == "Mês")  mes = text;
  }

  gerarRelatorio() async{
   /*  var query = {
      "report_type": tipoRelatorio,
      "year": ano,
      "mount": mes
    };
    var url = Uri.https("https://unipamapi.devjhon.com","/loans", query);
    notifyListeners();
    var report_type =  int.parse(tipoRelatorio);
    var year =  int.parse(ano);
    var mount = int.parse(mes);

    var url = Uri.parse("https://unipamapi.devjhon.com/loans?year=$year&report_type=$report_type&mount=$mount"); */
    /* var response = await http.get(url, 
      headers: {
        'Authorization': token
    }); */
  }
}