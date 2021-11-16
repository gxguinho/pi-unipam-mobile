import 'package:flutter/cupertino.dart';

class ReservationsController extends ChangeNotifier {
  static ReservationsController instance = new ReservationsController();

  List reservations = [];
  List book = [{"title": "Programação", "cod": "3232"}, {"title": "Herry Poter", "cod": "123"}];

  String pessoa = "";
  String codigo = "";
  String titleLivro = "";

  onChangedText(text, title) {
    if (title == "Pessoa") pessoa = text;
    if (title == "Livro") {
       var bookFormated = book.where((element) => element["title"] == text).toList();
       codigo = bookFormated[0]["cod"].toString();
       titleLivro = bookFormated[0]["title"].toString();
    }
   }

  cleanInputs() {
    pessoa = "";
    titleLivro = "";
    codigo = "";
  }

  registerReservation(context) {
    var date = new DateTime.now();
    var dateLimit = new DateTime(date.year, date.month, date.day + 7);
    var reservationFormatted = {
      "pessoa": pessoa,
      "status": false,
      "titleLivro": titleLivro,
      "codigo": codigo,
      "dateInicio": date.toString(),
      "dateFim": dateLimit.toString()
    };
    
    reservations.add(reservationFormatted);
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }
}