import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unipam_mobile/modules/app/Home/home_page.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/modules/auth/Login/login_page.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

 
}

class _SplashScreenState extends State<SplashScreen> {

   @override
   void initState() {
     getValidationDate().whenComplete(() async {
       Timer(Duration(seconds: 2), () {
         Navigator.push(context, 
          MaterialPageRoute(builder: (context) => 
            AppController.instance.token == "" ? LoginPage() : HomePage())
         );
       }
       );
     });
     super.initState();
   }

  Future getValidationDate() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = await sharedPreferences.getString("@unipamMobile_token");
    var obtainedUser = await sharedPreferences.getString("@unipamMobile_user");
    var token = obtainedToken!.substring(1, obtainedToken.length-1);
    setState(() {
      AppController.instance.token = 'Bearer $token';
      AppController.instance.user = obtainedUser.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/LoadingScreen.json', width: 500, height: 400),
          Lottie.asset('assets/Loading.json', width: 150, height: 150),
        ]
      ),
    );
  }
}