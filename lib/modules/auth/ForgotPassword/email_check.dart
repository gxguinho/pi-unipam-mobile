import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

class EmailCheckPage extends StatefulWidget {
  const EmailCheckPage({Key? key}) : super(key: key);

  @override
  _EmailCheckPageState createState() => _EmailCheckPageState();
}

class _EmailCheckPageState extends State<EmailCheckPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Verificar e-mail",
                  style: AppText.title,
                ),
                SizedBox(height: 20),
                Text(
                  "Um e-mail de verificação foi enviado para você",
                  textAlign: TextAlign.center,
                  style: AppText.description,
                ),
                const SizedBox(height: 30),
                LabelButtonNavegation(
                  text: "Enviar e-mail de confirmação",
                  route: "/newpassword",
                ),
                SizedBox(height: 20),
                LabelButtonNavegation(
                    text: "Pular, confirmar mais tarde", route: "/"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
