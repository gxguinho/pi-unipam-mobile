import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class ReadersController extends ChangeNotifier {
  static ReadersController instance = new ReadersController();


  String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNjY3NTIwNywiZXhwIjoxNjM2NzYxNjA3fQ.wjSCIGI0ZbwcAJ6x5r2Rd5mrqdzKXBvOAJrvMlRrwXM';
  var url = Uri.parse("https://unipamapi.devjhon.com/readers");

  List readers = [];

  String nome = "";
  String cpf = "";
  String rg = "";
  String email = "";
  String telefoneFixo = "";
  String telefoneCelular = "";
  String cep = "";
  String logradouro = "";
  String numero = "";
  String bairro = "";
  String complemento = "";

  onChangedText(text, title) {
    if (title == "Nome")  nome = text;
    if (title == "CPF")  cpf = text;
    if (title == "RG")  rg = text;
    if (title == "Email")  email = text;
    if (title == "Telefone fixo")  telefoneFixo = text;
    if (title == "Telefone celular")  telefoneCelular = text;
    if (title == "CEP") changeCep(text);
    if (title == "Logradouro")  logradouro = text;
    if (title == "Número")  numero = text;
    if (title == "Bairro")  bairro = text;
    if (title == "Complemento")  complemento = text;
  }

  cleanInput() {
    nome = "";
    cpf = "";
    rg = "";
    email = "";
    telefoneFixo = "";
    telefoneCelular = "";
    cep = "";
    logradouro = "";
    numero = "";
    bairro = "";
    complemento = "";
  }

  Future<void> getReaders() async{
     var response = await http.get(url, 
      headers: {
        'Authorization': token
      }
    );
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> readersParsed = [];

    json.forEach((element) { 
      readersParsed.add({
        "id": element['id'],
        "name": element['name'],
        "cpf": element['cpf'],
        "rg": element['rg'],
        "email": element['email'],
        "land_line": element['land_line'],
        "phone_number": element['phone_number'],
        "cep": element['cep'],
        "street": element['street'],
        "home_number": element['home_number'],
        "district": element['district'],
        "complement": element['complement'],
        "date": element['created_at'],
      });
    });

    readers = readersParsed.toList();
    notifyListeners();
  }

  deleteReaders(id) async {
    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/readers/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token
      }
    );
    notifyListeners();
    await getReaders();
  }

  registerReader(context) async {
    var registerReader = {
      "name": nome,
      "cpf": cpf,
      "rg": rg,
      "email": email,
      "land_line": telefoneFixo,
      "phone_number": telefoneCelular,
      "cep": cep,
      "street": logradouro,
      "home_number": numero,
      "district": bairro,
      "complement": complemento,
    };

    var response = await http.post(url, 
      body: registerReader,
      headers: {
        'Authorization': token
      }
    );

    await getReaders();
    notifyListeners();
    cleanInput();
    Navigator.pop(context);
  }

  changeCep(text) async {
    cep = text;
    if (cep.length == 9) {
      var url = Uri.parse('https://viacep.com.br/ws/$text/json/');
      var response = await http.get(url);
      Map<String, dynamic> json = jsonDecode(response.body);

      if (json['erro'] == true) {
        logradouro = "";
        bairro = "";
        complemento = "";
      } else {
        logradouro = json['logradouro'];
        bairro = json['bairro'];
        complemento = json['complemento'];
      }
      notifyListeners();
    }
  }

}