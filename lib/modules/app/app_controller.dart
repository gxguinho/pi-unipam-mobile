import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  String pageSelect = 'Modulos';
  Color colorSelected = AppColors.purple;
  bool isDarkTheme = false; 

  changeScreen(String pageSelected, context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
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