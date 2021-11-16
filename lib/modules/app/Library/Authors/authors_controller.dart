import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unipam_mobile/shared/widgets/modal_create/modal_create.dart';

class AuthorsController extends ChangeNotifier {
  static AuthorsController instance = new AuthorsController();

  List authors = [];
  String nome = "";

   var url = Uri.parse("https://unipamapi.devjhon.com/authors");
String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNjY3NTIwNywiZXhwIjoxNjM2NzYxNjA3fQ.wjSCIGI0ZbwcAJ6x5r2Rd5mrqdzKXBvOAJrvMlRrwXM';
  List errors = [
    {"title": "Nome", "error": true}
  ];

  onChangedText(text, title) {
    nome = text;
  }

  cleanInputs() {
    nome = "";
    errors = [
    {"title": "Nome", "error": false}
    ];
    notifyListeners();
  }

  Future<void> deleteAuthor(id) async {

    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/authors/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token
      }
    );
    notifyListeners();
    await getAuthors();
  }


  Future<void> getAuthors() async{
     var response = await http.get(url, 
      headers: {
        'Authorization': token
      }
    );
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> authorsParsed = [];

    json.forEach((element) { 
      authorsParsed.add({'name': element['name'], 'date': element['created_at'], 'id': element['id']});
    });

    authors = authorsParsed.toList();
    notifyListeners();
  }

  updateAuthors(context, inputs, modalTitle, titleModal) {
    
  }

  registerAuthors(context) async {
    
    var response = await http.post(url, 
      body: {
        "name": nome, 
      },
      headers: {
        'Authorization': token
      }
    );

    await getAuthors();
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
   } 
  } 