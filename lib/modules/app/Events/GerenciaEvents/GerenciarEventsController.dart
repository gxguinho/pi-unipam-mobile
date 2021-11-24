import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class GerenciarEventsController extends ChangeNotifier {
  static GerenciarEventsController instance = new GerenciarEventsController();

  List manage = [];

  String nome = "";
  String descricao = "";
  String endereco = "";
  String tipo = "";
  String categoria = "";
  String vagas = "";
  String datainicio = "";
  String datatermino = "";
  String datainscricao = "";
  String horarioevento = "";

  var url = Uri.parse("https://unipamapi.devjhon.com/events");
  String token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNzM2MzYyMSwiZXhwIjoxNjM3NDUwMDIxfQ.yQIQ6XUydhgIbPiIMMny5bp0QF2yt7Rs5YDeUOL0sQI";

  onChangedText(text, title) {
    if (title == "Nome do Evento") nome = text;
    if (title == "Descrição do Evento") descricao = text;
    if (title == "Endereço do Evento") endereco = text;
    if (title == "Tipo Do Evento") tipo = text;
    if (title == "Categoria") categoria = text;
    if (title == "Numero De Vagas") vagas = text;
    if (title == "Data De Inicio") datainicio = text;
    if (title == "Data De Término") datatermino = text;
    if (title == "Data De Inscrição") datainscricao = text;
    if (title == "Horário Do Evento") horarioevento = text;
  }

  cleanInputs() {
    nome = "";
    descricao = "";
    endereco = "";
    tipo = "";
    categoria = "";
    vagas = "";
    datainicio = "";
    datatermino = "";
    datainscricao = "";
    horarioevento = "";
  }

  Future<void> getManageEvents() async {
    var response = await http.get(url, headers: {'Authorization': token});
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> manegeEventsParsed = [];

    json.forEach((element) {
      manegeEventsParsed.add({
        'name': element['name'],
        'date': element['created_at'],
        'id': element['id']
      });
    });

    manage = manegeEventsParsed.toList();
    notifyListeners();
  }

  Future<void> deleteEvent(id) async {
    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/events/$id');

    var response =
        await http.delete(urlDelete, headers: {'Authorization': token});
    notifyListeners();
    await getManageEvents();
  }

  registerManege(context) async {
     var manageRegister = {
      "name": nome,
      "description": descricao,
      "address": endereco,
      "category": categoria,
      "vacancies_number": int.parse(vagas),
      "start_date": datainicio,
      "end_date": datatermino,
      "subscription_date": datainscricao,
      "event_time": horarioevento,
      "event_image": horarioevento,
    };

    var dio = Dio();
    try {
      var response = await dio.post("https://unipamapi.devjhon.com/events", 
      data: manageRegister, options: Options(
      headers: {
        'Authorization': token
      }
      ));
    } catch (e) {
      print(e);
    }

    await getManageEvents();
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }
}
