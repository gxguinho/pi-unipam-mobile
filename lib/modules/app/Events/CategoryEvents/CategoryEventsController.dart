import 'package:flutter/cupertino.dart';

class CategoryEventsController extends ChangeNotifier {
  static CategoryEventsController instance = new CategoryEventsController();

  List category = [];

  String categoria = "";

  onChangedText(text, title) {
    categoria = text;
  }

  cleanInputs() {
    categoria = "";
  }

  registerCategory(context) {
    var categorysRegister = {"nome": categoria, "date": DateTime.now()};

    category.add(categorysRegister);
    Navigator.pop(context);
    notifyListeners();
  }
}
