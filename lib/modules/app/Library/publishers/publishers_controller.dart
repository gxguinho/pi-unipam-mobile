import 'package:flutter/cupertino.dart';

class PublishersController extends ChangeNotifier{
  static PublishersController instance = new PublishersController();

  List publishers = [];
  String publisher = "";

  onChangedText(text, title) {
    publisher = text;
   }

  cleanInputs() {
    publisher = "";
  }

  registerPublisher(context) {
    var publisherFormatted = {
      "publisher": publisher,
      "date": DateTime.now()
    };
    
    publishers.add(publisherFormatted);
    notifyListeners();
    cleanInputs();
    Navigator.pop(context);
  }

}