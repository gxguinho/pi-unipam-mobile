import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class  StudentsController extends ChangeNotifier {
  static StudentsController instance = new StudentsController();

  List students = [];

  String token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkOWYyYmEyLWQ1OTYtNGUzYy04N2RhLTA3NTg2YWYzMjhmNCIsImVtYWlsIjoiYWRtaW5AdW5pcGFtYXBpLmNvbS5iciIsImlhdCI6MTYzNjkxOTAwMSwiZXhwIjoxNjM3MDA1NDAxfQ.zUqK1pNZJjqncgzuaS3ofeHL9zCqAmTkm6yJolLj9rs';
  var url = Uri.parse("https://unipamapi.devjhon.com/students");

  Future<void> deleteStudent(id) async {
    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/students/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token
      }
    );
    
    notifyListeners();
    await getStudent();
  }

  Future<void> getStudent() async {
    var response = await http.get(url, 
      headers: {
        'Authorization': token
      }
    );
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> studentsParsed = [];

    json.forEach((element) { 
     studentsParsed.add({
       'name': element['name'], 
       'date': element['created_at'], 
       'id': element['id']});
    });

    students = studentsParsed.toList();
    notifyListeners();
  }

  onChangedText(text, title) {

  }

  cleanInputs() {

  }

  registerStudent(context) {

  }
  
}