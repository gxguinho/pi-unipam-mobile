import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/app/Frequency/frequency_view.dart';
import 'modules/app/app_controller.dart';
import 'modules/app/Academic/academic_page.dart';
import 'modules/app/Home/home_page.dart';
import 'modules/auth/ForgotPassword/email_check.dart';
import 'modules/auth/ForgotPassword/forgot_password.dart';
import 'modules/auth/ForgotPassword/new_password.dart';
import 'modules/auth/Login/login_page.dart';

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
                  brightness: AppController.instance.isDarkTheme
                      ? Brightness.light
                      : Brightness.dark,
                  fontFamily: GoogleFonts.archivo().toString()),
              title: "Unipam Mobile",
              initialRoute: '/',
              routes: {
                '/': (context) => LoginPage(),
                '/forgotpassword': (context) => ForgotPasswordPage(),
                '/emailcheck': (context) => EmailCheckPage(),
                '/newpassword': (context) => NewPasswordPage(),
                "/home": (context) => HomePage(),
                "/frequencyview": (context) => AcademicPage(),
                "/academic": (context) => FrequencyView()
              });
        });
  }
}
