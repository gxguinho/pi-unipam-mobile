import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/widgets/label_button/label_button.dart';
import 'package:unipam_mobile/shared/widgets/text_input/text_input.dart';

class EmailCheck extends StatefulWidget {
  const EmailCheck({Key? key}) : super(key: key);

  @override
  _EmailCheckState createState() => _EmailCheckState();
}

class _EmailCheckState extends State<EmailCheck> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      "Verificar e-mail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Um e-mail de verificação \n foi enviado para você",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: LabelButton(
                          text: "Enviar e-mail de confirmação",
                          route: "/newpassword",
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: LabelButton(
                          text: "Pular, confirmar mais tarde",
                          route: "/forgotpassword",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
