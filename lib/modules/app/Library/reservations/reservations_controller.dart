import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/modules/app/library/book/book_controller.dart';
import 'package:unipam_mobile/modules/app/library/readers/readers_controller.dart';

class ReservationsController extends ChangeNotifier {
  static ReservationsController instance = new ReservationsController();

  List reservations = [];
  List book = [];
  List readers = [];
  String token = AppController.instance.token!;

  String pessoa = "";
  String livro = "";

  var jsonReservesParsed = [];
  var readersList = ReadersController.instance.readers;
  var booksList = BookController.instance.books;
  var jsonBookParsed = [];

  

  onChangedText(text, title) {
    if (title == "Pessoa") pessoa = text;
    if (title == "Livro")  livro = text;
  }
  cleanInputs() {
    pessoa = "";
    livro ="";
  }

  getReservations() async{

    var jsonReservesParsed = [];
    var jsonReaderParsed = [];
    var jsonBookParsed = [];


    var url = Uri.parse("https://unipamapi.devjhon.com/reserves");
    var urlBooks = Uri.parse("https://unipamapi.devjhon.com/books");
    var urlReader = Uri.parse("https://unipamapi.devjhon.com/readers");
    
    var responseBook = await http.get(urlBooks, 
      headers: {
        'Authorization': token
      }

    );
    var responseReader = await http.get(urlReader, 
      headers: {
        'Authorization': token
      });

    var response = await http.get(url, 
      headers: {
        'Authorization': token
      }
    );
     
      var jsonReserves = jsonDecode(response.body);
      var jsonBook = jsonDecode(responseBook.body);
      var jsonReader = jsonDecode(responseReader.body);
      
     

      jsonBook.forEach((element) { 
      jsonBookParsed.add({
          "id": element['id'],
          "title": element['title'],
      });
      });

      jsonReader.forEach((element) { 
      jsonReaderParsed.add({
          "id": element['id'],
          "name": element['name'],
      });
      });

      jsonReserves.forEach((element) { 
      List reader = jsonReaderParsed.where((e) => 
            element['reader_id'] == e['id']
      ).toList();
      List book = jsonBookParsed.where((e) => 
            element['book_id'] == e['id']
      ).toList();
      jsonReservesParsed.add({
          "id": element['id'],
          "code": element['code'],
          "reader": reader[0]['name'],
          "book": book[0]['title'],
          "return_deadline": element['return_deadline'],
      });
      });
      
    notifyListeners();
    reservations = jsonReservesParsed.toList();
  }

  registerReservation(context) async{
    var reservationFormatted = {
      "reader_id": pessoa,
      "book_id": livro,
    };

    try {
      var dio = Dio();
      var response = await dio.post("https://unipamapi.devjhon.com/reserves",
          data: reservationFormatted,
          options: Options(headers: {'Authorization': token
      }));
    } catch (e) {
    }
    await getReservations();
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }
}