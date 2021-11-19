import 'package:flutter/cupertino.dart';

class BillsToPayController extends ChangeNotifier {
  static BillsToPayController instance = new BillsToPayController();

  //String token =
  //    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNjY3NTIwNywiZXhwIjoxNjM2NzYxNjA3fQ.wjSCIGI0ZbwcAJ6x5r2Rd5mrqdzKXBvOAJrvMlRrwXM';
  //var url = Uri.parse("https://unipamapi.devjhon.com/billstopay");

  List billsToPay = [];

  String numtitulo = "";
  String dataCadastro = "";
  String descricao = "";
  String dataEmissao = "";
  String vencimento = "";
  String valorTitulo = "";
  String fornecedor = "";

  onChangedText(text, title) {
    if (title == "Número do Título") numtitulo = text;
    if (title == "Data de cadastro") dataCadastro = text;
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

  //Future<void> getbillsToPay() async {
  //  var response = await http.get(url, headers: {'Authorization': token});
  //  var json = jsonDecode(response.body) as List;
  //  List<Map<dynamic, dynamic>> billsToPayParsed = [];
//
  //  json.forEach((element) {
  //    billsToPayParsed.add({
  //      "id": element['id'],
  //      "title_number": element['title_number'],
  //      "registration_date": element['registration_date'],
  //      "description": element['description'],
  //      "emission_date": element['emission_date'],
  //      "due_date": element['due_date'],
  //      "title_value": element['title_value'],
  //      "provider": element['provider'],
  //    });
  //  });
//
  //  billsToPay = billsToPayParsed.toList();
  //  notifyListeners();
  //}
//
  //deletebillsToPay(id) async {
  //  var urlDelete = Uri.parse('https://unipamapi.devjhon.com/billstopay/$id');
//
  //  var response =
  //      await http.delete(urlDelete, headers: {'Authorization': token});
  //  notifyListeners();
  //  await getbillsToPay();
  //}

  registerbillsToPay(context) async {
    var registerbillsToPay = {
      "title_number": numtitulo,
      "registration_date": dataCadastro,
      "description": descricao,
      "emission_date": dataEmissao,
      "due_date": vencimento,
      "title_value": valorTitulo,
      "provider": fornecedor,
    };

    //var response = await http
    //    .post(url, body: registerbillsToPay, headers: {'Authorization': token});
//
    //await getbillsToPay();

    billsToPay.add(registerbillsToPay);
    notifyListeners();
    cleanInput();
    Navigator.pop(context);
  }
}
