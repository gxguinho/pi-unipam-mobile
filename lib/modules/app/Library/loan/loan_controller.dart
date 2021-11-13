import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoanController extends ChangeNotifier {
  static LoanController instance = LoanController();

  List reporttype = [
    {
      "monthborrowed": 5,
      "yearborrowed": 10,
      "moremonthborrowed": 2,
      "moreyearborrowed": 4,
    },
  ];

  handleRegisterLoan(name, category, company, author, synopsis, context) {
    // ignore: unused_local_variable
    var book = {
      "name": name,
      "category": category,
      "company": company,
      "author": author,
      "synopsis": synopsis
    };
  }
}
