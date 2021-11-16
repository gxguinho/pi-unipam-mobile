import 'package:flutter/cupertino.dart';

class CategoryController  extends ChangeNotifier {

  static CategoryController instance = new CategoryController();

  List categories = [];
  String category = "";

  cleanInputs() {
    category = "";
  }

   onChangedText(text, title) {
    category = text;
  }

  registerCategory(context) {
     var categoryFormatted = {
      "category": category,
      "date": DateTime.now()
    };
    
    categories.add(categoryFormatted);
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }
}