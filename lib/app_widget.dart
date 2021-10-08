import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modules/ForgotPassword/ForgotPassword_page.dart';
import 'modules/ForgotPassword/NewPassword_page.dart';
import 'modules/ForgotPassword/email_check.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unipam Mobile',
      initialRoute: '/forgotpassword',
      routes: {
        '/forgotpassword': (context) => ForgotPassword(),
        '/emailcheck': (context) => EmailCheck(),
        '/newpassword': (context) => NewPassword(),
      },
    );
  }
}
