import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  String pageSelect = 'Modulos';
  Color colorSelected = AppColors.purple;
  bool isDarkTheme = false; 

  String name = "";
  String email = "";
  String user = "";
  String? token = "";

  Future decodeUser() async {

    

  }

  changeScreen(String pageSelected, context, String route) {
    Navigator.of(context).pushNamed(route);
    pageSelect = pageSelected;
    notifyListeners();
  }

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  changeColor(Color color) {
    colorSelected = color;
    notifyListeners();
  }

  logout(context) {
    Navigator.of(context).pushReplacementNamed('/');
  }
}