import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/widgets/label_button/label_button.dart';
import 'package:unipam_mobile/shared/widgets/text_input/text_input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Voltar'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
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
                    Container(
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      "Esqueci senha",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Ensira seu email associado com sua conta para ser enviado uma confirmação",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(child: TextInput1(type: "Email *")),
                    const SizedBox(height: 30),
                    Container(
                      child: LabelButton(
                        text: "Enviar email de confirmação",
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
