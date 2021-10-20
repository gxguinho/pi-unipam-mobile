import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/text_input_auth/text_input_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController nameController = TextEditingController();

  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 250,
                ),
                Text(
                  "Esqueci senha",
                  style: AppText.title,
                ),
                SizedBox(height: 20),
                Text(
                  "Ensira seu e-mail associado com sua conta para ser enviado uma confirmação",
                  style: AppText.description,
                ),
                SizedBox(height: 30),
                TextInputAuth(type: "Email", onChanged: (text) => email = text),
                SizedBox(height: 30),
                LabelButtonNavegation(
                    text: "Enviar e-mail de confirmação", route: "/emailcheck")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
