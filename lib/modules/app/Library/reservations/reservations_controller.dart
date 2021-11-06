
import 'package:flutter/cupertino.dart';

class ReservationsController extends ChangeNotifier {
  static ReservationsController instance = ReservationsController();

  var book = [{"title": "Programação", "cod": "3232"}, {"title": "Herry Poter", "cod": "123"}];
  var reservation = [];

  String cod = "";
  String titleLivro = "";
  String pessoa = "";

  changedText(text, title) {
    if (title == "Pessoa") pessoa = text;
    if (title == "Livro") {
       var bookFormated = book.where((element) => element["title"] == text).toList();
       cod = bookFormated[0]["cod"].toString();
       titleLivro = bookFormated[0]["title"].toString();
    }
  }

  registerBook(context) {

    var status = false;

    var bookRegister = {
      "cod": cod,
      "title": titleLivro,
      "pessoa": pessoa,
      "status": status,
    };

    reservation.add(bookRegister);
    Navigator.pop(context);
    notifyListeners();
  }

}