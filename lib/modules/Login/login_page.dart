import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: SvgPicture.asset('assets/logo.svg')),
                    Container(
                      child: Text(
                        'Bem Vindo',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.title,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Logue com suas credenciais',
                        style: TextStyle(fontSize: 20, color: AppColors.text),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            onChanged: (text) {
                              print(text);
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: AppColors.white,
                                ),
                                labelText: 'E-mail *',
                                labelStyle: TextStyle(color: AppColors.white),
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: isHiddenPassword,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary)),
                                prefixIcon: Icon(
                                  Icons.security,
                                  color: AppColors.white,
                                ),
                                labelText: 'Senha *',
                                labelStyle: TextStyle(color: AppColors.white),
                                border: OutlineInputBorder(),
                                suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(
                                      Icons.visibility,
                                      color: AppColors.white,
                                    ))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            onPressed: () {},
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Entrar',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a Senha?',
                          style: TextStyle(fontSize: 20, color: AppColors.text),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
