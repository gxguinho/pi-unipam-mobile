import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/auth/Login/login_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/text_input_auth/text_input_auth.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SvgPicture.asset('assets/logo.svg', height: 250),
                  Text(
                    "Bem Vindo",
                    style:  AppText.title,
                  ),
                  Text(
                    "Logue com suas credenciais",
                    style: AppText.description,
                  ),
                  SizedBox(height: 40),
                  TextInputAuth(
                    type: "Email", 
                    onChanged: (text) => LoginController.instance.email = text
                  ),
                  SizedBox(height: 20),
                  TextInputAuth(
                    type: "Senha",
                    onChanged: (text) => LoginController.instance.password = text
                  ),
                  SizedBox(height: 25,),
                  LabelButtonNavegation(
                     text: "Entrar", 
                     onChanged: (context) => LoginController.instance.login(context),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/forgotpassword');
                      }, 
                      child: Text(
                        'Esqueceu a Senha?',
                        style: AppText.buttonText
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }

  
}
