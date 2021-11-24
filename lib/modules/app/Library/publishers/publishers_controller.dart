import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:http/http.dart' as http;

class PublishersController extends ChangeNotifier{
  static PublishersController instance = new PublishersController();

  List publishers = [];
  String publisher = "";

  String? token = AppController.instance.token;
  var url = Uri.parse("https://unipamapi.devjhon.com/publishing_companies");

  Future<void> getPublishers() async{
     var response = await http.get(url, 
      headers: {
        'Authorization': token!
      }
    );

    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> publishersParsed = [];

    json.forEach((element) { 
      publishersParsed.add({'name': element['name'], 'date': element['created_at'], 'id': element['id']});
    });

    publishers = publishersParsed.toList();
    notifyListeners();
  }

  Future<void> deleteAuthor(id) async {

    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/publishing_companies/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token!
      }
    );
    notifyListeners();
    await getPublishers();
  }

  onChangedText(text, title) {
    publisher = text;
   }

  cleanInputs() {
    publisher = "";
  }

  registerPublisher(context) async{
    var response = await http.post(url, 
      body: {
        "name": publisher, 
      },
      headers: {
        'Authorization': token!
      }
    );
    
    await getPublishers();
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }

}