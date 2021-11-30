import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';

class BillsToPayController extends ChangeNotifier {
  static BillsToPayController instance = new BillsToPayController();

  var url = Uri.parse("https://unipamapi.devjhon.com/bills-to-pay");

  String token = AppController.instance.token!;

  List billsToPay = [];

  String numtitulo = "";
  String dataCadastro = "";
  String descricao = "";
  String dataEmissao = "";
  String vencimento = "";
  String valorTitulo = "";
  String fornecedor = "";
  String tipo = "";

  onChangedText(text, title) {
    if (title == "Número do Título") numtitulo = text;
    if (title == "Data de cadastro") dataCadastro = text;
    if (title == "Tipo de cobrança") tipo = text;    
    if (title == "Descrição") descricao = text;
    if (title == "Data da emissão") dataEmissao = text;
    if (title == "Vencimento") vencimento = text;
    if (title == "Valor do título") valorTitulo = text;
    if (title == "Fornecedor") fornecedor = text;
  }

  cleanInput() {
    numtitulo = "";
    dataCadastro = "";
    descricao = "";
    dataEmissao = "";
    vencimento = "";
    valorTitulo = "";
    fornecedor = "";
  }

  Future<void> getbillsToPay() async {
    var response = await http.get(url, headers: {'Authorization': token});
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> billsToPayParsed = [];

    json.forEach((element) {
      billsToPayParsed.add({
        "id": element['id'],
        "title_number": element['title_number'],
        "registration_date": element['registration_date'],
        "description": element['description'],
        "issue_date": element['issue_date'],
        "due_date": element['due_date'],
        "title_value": element['title_value'],
        "provider": element['provider'],
      });
    });

    billsToPay = billsToPayParsed.toList();
    notifyListeners();
  }

  deletebillsToPay(id) async {
    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/bills-to-pay/$id');

    var response =
        await http.delete(urlDelete, headers: {'Authorization': token});
    notifyListeners();
    await getbillsToPay();
  }

  registerbillsToPay(context) async {
    var registerbillsToPay = {
      "title_number": numtitulo,
      "registration_date": dataCadastro,
      "bill_type": tipo,
      "description": descricao,
      "issue_date": dataEmissao,
      "due_date": vencimento,
      "title_value": int.parse(valorTitulo),
      "provider": fornecedor,
    };

    var dio = Dio();
    try {
      var response = await dio.post("https://unipamapi.devjhon.com/bills-to-pay", 
      data: registerbillsToPay, options: Options(
      headers: {
        'Authorization': token
      }
      ));
    } catch (e) {
      print(e);
    }

    await getbillsToPay();
    notifyListeners();
    cleanInput();
    Navigator.pop(context);
  }
}
