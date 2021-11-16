import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LanguageController extends ChangeNotifier {
  static LanguageController instance = new LanguageController();

  List languages = [];
  String language = "";

  String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNjY3NTIwNywiZXhwIjoxNjM2NzYxNjA3fQ.wjSCIGI0ZbwcAJ6x5r2Rd5mrqdzKXBvOAJrvMlRrwXM';
  var url = Uri.parse("https://unipamapi.devjhon.com/languages");

  onChangedText(text, title) {
    language = text;
   }

  cleanInputs() {
    language = "";
  }

  Future<void> deleteLanguage(id) async {

    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/languages/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token
      }
    );
    notifyListeners();
    await getLanguage();
  }

  Future<void> getLanguage() async{
     var response = await http.get(url, 
      headers: {
        'Authorization': token
      }
    );
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> languageParsed = [];

    json.forEach((element) { 
      languageParsed.add({'name': element['name'], 'date': element['created_at'], 'id': element['id']});
    });

    languages = languageParsed.toList();
    notifyListeners();
  }

  registerLanguage(context) async {

    var response = await http.post(url, 
      body: {
        "name": language, 
      },
      headers: {
        'Authorization': token
      }
    );

    await getLanguage();
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }
}