import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHiddenPassword = true;

  String email = '';
  String passaword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
           child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset('assets/logo.svg', height: 250,)
                      ),
                      Container(
                        child: Text(
                          'Bem Vindo',
                          style: AppText.title
                        ),
                      ),
                      Container(
                        child: Text(
                          'Logue com suas credenciais',
                          style: AppText.description,
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
                              style: AppText.input,
                              onChanged: (text) {
                                email = text;
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
                                  labelText: 'E-mail',
                                  labelStyle: AppText.input,
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextField(
                              style: AppText.input,
                              onChanged:(text){
                                passaword = text;
                              },
                              obscureText: isHiddenPassword,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.primary)),
                                  prefixIcon: Icon(
                                    Icons.security,
                                    color: AppColors.white,
                                  ),
                                  labelText: 'Senha',
                                  labelStyle: AppText.input,
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
                              onPressed: () {
                                if(email == 'mariafernanda212@hotmail.com' && passaword == '123' ){
                                  print('Logado');
                                }else{
                                  print ('Não Logado');
                                }
                              },
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
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
