import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:unipam_mobile/modules/app/app_controller.dart';
class BookController extends ChangeNotifier {
  static BookController instance = new BookController();

  List books = [];

  String codigo = "";
  String titulo = "";
  String autores = "";
  String edicao = "";
  String volume = "";
  String ano = "";
  String editora = "";
  String idioma = "";
  String categoria = "";
  String quantidadeExeplares = "";
  String localizacao = "";

  String token = AppController.instance.token!;
  var url = Uri.parse("https://unipamapi.devjhon.com/books");

   onChangedText(text, title) {
    if (title == "Código") codigo = text;
    if (title == "Título") titulo = text;
    if (title == "Autores") autores = text;
    if (title == "Edição") edicao = text;
    if (title == "Volume") volume = text;
    if (title == "Ano") ano = text;
    if (title == "Editora") editora = text;
    if (title == "Idioma") idioma = text;
    if (title == "Categoria") categoria = text;
    if (title == "Quantidade de exemplares") quantidadeExeplares = text;
    if (title == "Localização") localizacao = text;
  }

   cleanInputs() {
    codigo = "";
    titulo = "";
    autores = "";
    edicao = "";
    volume = "";
    ano = "";
    editora = "";
    idioma = "";
    categoria = "";
    quantidadeExeplares = "";
    localizacao = "";
  }

  getBooks() async{
     var response = await http.get(url, 
      headers: {
        'Authorization': token
      }
    );

    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> booksParsed = [];

    json.forEach((element) { 
      booksParsed.add({
        'title': element['title'], 
        'code': element['code'],
        'edition': element['edition'],
        'volume': element['volume'],
        'year': element['year'],
        'author': element['authors'][0]['name'],
        'publishing_company_id': element['publishing_company_id'],
        'language_id': element['language_id'],
        'category': element['category'],
        'copies_number': element['copies_number'],
        'copies_number_available': element['copies_number_available'],
        'location': element['location'],
        'created_at': element['created_at'],
        'id': element['id']});
    });

    books = booksParsed.toList();
    notifyListeners();
  }

  registerBook(context) async{
    var bookRegister = {
      'title': titulo, 
      'code': codigo,
      'edition': int.parse(edicao),
      'authors': [autores],
      'volume': int.parse(volume),
      'year': int.parse(ano),
      'author': autores,
      'publishing_company_id': editora,
      'language_id': idioma,
      'category': categoria,
      'copies_number': int.parse(quantidadeExeplares),
      'copies_number_available': int.parse(quantidadeExeplares),
      'location': localizacao,
    };

    var dio = Dio();
    try {
       var response = await dio.post("https://unipamapi.devjhon.com/books",
          data: bookRegister,
          options: Options(headers: {'Authorization': token
      }));
    } catch (e) {
      print(e);
    }

    await getBooks();
    Navigator.pop(context);
    notifyListeners();
  }

  deleteBook(id) async {

    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/books/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token
      }
    );
    notifyListeners();
    await getBooks();
  }

} 