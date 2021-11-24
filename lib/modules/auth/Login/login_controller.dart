import 'dart:convert';

import 'package:dio/dio.dart';
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
  
  login_(context) async {
    if (email == "" || password == "") { 
      
      if(32131 == 201) {

        //var token = jsonDecode(12.body) as dynamic;
        //SharedPreferences prefs = await SharedPreferences.getInstance();
        //await prefs.setString('@unipamMobile_user', jsonEncode(token['user']));
        //await prefs.setString('@unipamMobile_token', token['token']);
        
        //AppController.instance.token =  token['token'];
        //AppController.instance.user =  token['user'].toString();

        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        alertDismiss(context, "Erro ao Entrar! ");
      }
    } else {
      alertDismiss(context, "Não Foram preenchidos todos os campos");
    }

  }

  login(context) async {
     if (email != "" || password != "") {

       var dados = {
         "email": 'admin@unipamapi.com.br',
         "password": 'admin'
       };

       try {
        var dio = Dio();
         var response = await dio.post("https://unipamapi.devjhon.com/sessions/login",
          data: dados
        );

        if(response.statusCode == 201) {
          var user = response.data;
          //var userr = jsonEncode(response.data);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('@unipamMobile_token', jsonEncode(user['token']));
          //await prefs.setString('@unipamMobile_user', userr);
        
          AppController.instance.token =  'Bearer '+ user['token'];
          //AppController.instance.user =  user['user'];
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          alertDismiss(context, "Dados Incorretos! ");
        }

       } catch (e) {
          alertDismiss(context, "Erro! ");
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
      content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/error.json", width: 50, height: 50),
              SizedBox(height: 20),
              Text(
                title,
                style: AppText.alertContent,
                textAlign: TextAlign.center,
              ),
            ],
          ),
      ),
      duration: Duration(seconds: 3),
    ));
}