import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.Dart';
import 'package:lottie/lottie.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class LoginController extends ChangeNotifier {

  static LoginController instance = LoginController();

  String email = "";
  String password = "";

  String baseUrl = 'https://unipamapi.devjhon.com';

  var url = Uri.parse('https://unipamapi.devjhon.com/sessions/login');
  
  login(context) async {
    if (email == "" || password == "") { 
      var response = await http.post(url, 
        body: {
          "email": "admin@unipamapi.com.br", 
          'password': "admin"
        });
    
      if(response.statusCode == 201) {

        var token = jsonDecode(response.body) as dynamic;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('@unipamMobile_user', jsonEncode(token['user']));
        await prefs.setString('@unipamMobile_token', token['token']);
        
        AppController.instance.token =  token['token'];
        AppController.instance.user =  token['user'].toString();

        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        alertDismiss(context, "Erro ao Entrar! ");
      }
    } else {
      alertDismiss(context, "Não Foram preenchidos todos os campos");
    }

  }

}

alertDismiss(context, title) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.vertical,
      backgroundColor: AppController.instance.colorSelected,
      content: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/error.json", width: 50, height: 50),
            SizedBox(height: 20),
            Text(
              title,
              style: AppText.alertContent,
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 3),
    ));
}