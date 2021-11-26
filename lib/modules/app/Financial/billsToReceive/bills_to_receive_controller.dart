import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class BillsToReceiveController extends ChangeNotifier {
  static BillsToReceiveController instance = new BillsToReceiveController();

  var url = Uri.parse("https://unipamapi.devjhon.com/bills-to-receive");

  String token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNzM2MzYyMSwiZXhwIjoxNjM3NDUwMDIxfQ.yQIQ6XUydhgIbPiIMMny5bp0QF2yt7Rs5YDeUOL0sQI';

  List billsToReceive = [];

  String lancamento = "";
  String dataEmissao = "";
  String vencimento = "";
  String ultimoRecibimento = "";
  String portador = "";
  String cliente = "";
  String nomeClinte = "";
  String parcela = "";
  String valorParcela = "";
  String referente = "";
  String valorPago = "";
  String acrescimo = "";
  String descontos = "";
  String valorReceber = "";
  String vendedor = "";
  String nomeVendedor = "";
  String comissao = "";
  String valorComissao = "";

  onChangedText(text, title) {
    if (title == "Lançamento") lancamento = text;
    if (title == "Data de Emissão") dataEmissao = text;
    if (title == "Vencimento") vencimento = text;
    if (title == "Data do último recebimento") ultimoRecibimento = text;
    if (title == "Portador") portador = text;
    if (title == "Cliente") cliente = text;
    if (title == "Nome Cliente") nomeClinte = text;
    if (title == "Parcela") parcela = text;
    if (title == "Valor Parcela") valorParcela = text;
    if (title == "Referente") referente = text;
    if (title == "Valor Pago") valorPago = text;
    if (title == "Acrécimos") acrescimo = text;
    if (title == "Descontos") descontos = text;
    if (title == "Valor a Receber") valorReceber = text;
    if (title == "Vendedor") vendedor = text;
    if (title == "Nome do Vendedor") nomeVendedor = text;
    if (title == "Comissão") comissao = text;
    if (title == "Valor da Comissão") valorComissao = text;
  }

  cleanInput() {
    lancamento = "";
    dataEmissao = "";
    vencimento = "";
    ultimoRecibimento = "";
    portador = "";
    cliente = "";
    nomeClinte = "";
    parcela = "";
    valorParcela = "";
    referente = "";
    valorPago = "";
    acrescimo = "";
    descontos = "";
    valorReceber = "";
    vendedor = "";
    nomeVendedor = "";
    comissao = "";
    valorComissao = "";
  }

  Future<void> getbillsToReceive() async {
    var response = await http.get(url, headers: {'Authorization': token});
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> billsToReceiveParsed = [];

    json.forEach((element) {
      billsToReceiveParsed.add({
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

    billsToReceive = billsToReceiveParsed.toList();
    notifyListeners();
  }

  deletebillsToReceive(id) async {
    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/bills-to-pay/$id');

    var response =
        await http.delete(urlDelete, headers: {'Authorization': token});
    notifyListeners();
    await getbillsToReceive();
  }

  registerReceive(context) {
    var receiveRegister = {
      "lancamento": lancamento,
      "data_de_emissao": dataEmissao,
      "vencimento": vencimento,
      "portador": portador,
      "cliente": cliente,
      "nome_cliente": nomeClinte,
      "parcela": parcela,
      "valor_parcela": valorParcela,
      "referente": referente,
      "valor_pago": valorPago,
      "acrecimos": acrescimo,
      "descontos": descontos,
      "valor_a_receber": valorReceber,
      "vendedor": vendedor,
      "nome_do_vendedor": nomeVendedor,
      "comissao": comissao,
      "valor_da_comissao": valorComissao,
    };

    billsToReceive.add(receiveRegister);
    Navigator.pop(context);
    notifyListeners();
  }
}
