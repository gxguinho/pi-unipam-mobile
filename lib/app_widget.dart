import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modules/ForgotPassword/ForgotPassword_page.dart';
import 'modules/ForgotPassword/NewPassword_page.dart';
import 'modules/ForgotPassword/email_check.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unipam_mobile/modules/Academic/academic_page.dart';
import 'package:unipam_mobile/modules/Home/home_page.dart';
import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
     animation: AppController.instance,
     builder: (context, child) {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: AppController.instance.colorSelected,
          brightness: AppController.instance.isDarkTheme ? Brightness.light : Brightness.dark,
          fontFamily: GoogleFonts.archivo().toString()
        ),
        title: "Unipam Mobile",
        initialRoute: '/home',
        routes: {
          "/home": (context) => HomePage(),
          "/academic": (context) => AcademicPage()
        }
      );
   });
  }
}
