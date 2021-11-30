import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:unipam_mobile/modules/app/academic/students/students_controller.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/modules/app/library/authors/authors_controller.dart';
import 'package:unipam_mobile/modules/app/library/readers/readers_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class InputTextCreate extends StatelessWidget {

  final String title;
  final IconData icon;
  final int maxLength;
  final TextInputType type;
  final String textFormatter;
  final String? quantAlunos;
  final String? nomeCurso;
  final Function(String)? onChangedText;
  final String error;
  final List isError; 
  final Listenable animation;
  final dynamic? controller;
   
  const InputTextCreate({
     Key? key, 
     required this.title, 
     required this.icon,
     this.onChangedText, 
     required this.maxLength, 
     required this.type, 
     required this.textFormatter, 
     this.quantAlunos, 
     this.nomeCurso, 
     required this.error, 
     required this.isError, 
     required this.animation, 
     this.controller }) : super(key: key);
     
  @override
  Widget build(BuildContext context) {

        final _controller = TextEditingController();

         return AnimatedBuilder(
           animation: ReadersController.instance,
           builder: (context, child) {
             return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                onChanged: (text) => onChangedText!(text),
                style: AppText.inputText,
                keyboardType: type,
                maxLength: maxLength == 0 ? null : maxLength,
                inputFormatters: [
                  new MaskTextInputFormatter(mask:  textFormatter, filter: {"#": RegExp(r'[0-9]')})
                ],
                controller: TextEditingController(text: 
                  title == 'Nome' ? controller == "ReadersController" ? ReadersController.instance.nome : controller == "StudentsController" ? StudentsController.instance.nome : null : 
                  title == 'CPF' ? controller == "ReadersController" ? ReadersController.instance.cpf : null : 
                  title == 'RG' ? controller == "ReadersController" ? ReadersController.instance.rg : null : 
                  title == 'Email' ? controller == "ReadersController" ? ReadersController.instance.email : null : 
                  title == 'Telefone fixo' ? controller == "ReadersController" ? ReadersController.instance.telefoneFixo : null : 
                  title == 'Telefone celular' ? controller == "ReadersController" ? ReadersController.instance.telefoneCelular : null : 
                  title == 'CEP' ? controller == "ReadersController" ? ReadersController.instance.cep : controller == "StudentsController" ? StudentsController.instance.cep : null : 
                  title == 'Logradouro' ? controller == "ReadersController" ? ReadersController.instance.logradouro :controller == "StudentsController" ? StudentsController.instance.logradouro : null : 
                  title == 'Número' ? controller == "ReadersController" ? ReadersController.instance.numero : controller == "StudentsController" ? StudentsController.instance.numero : null : 
                  title == 'Bairro' ? controller == "ReadersController" ? ReadersController.instance.bairro : controller == "StudentsController" ? StudentsController.instance.bairro : null : 
                  title == 'Complemento' ? controller == "ReadersController" ? ReadersController.instance.complemento : controller == "StudentsController" ? StudentsController.instance.complemento : null
                  : null,
                ),
                decoration: InputDecoration(
                    errorText: isError == true ? error : null,
                    labelText: title,
                    labelStyle: AppText.input,
                    //errorText: "campo de texto obrigatório",
                    prefixIcon: Icon(
                      icon,
                      color: AppController.instance.isDarkTheme ? AppColors.shape : AppColors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppController.instance.colorSelected, width: 2)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppController.instance.colorSelected.withOpacity(0.4),
                          width: 2
                      ),
                    ),
                  )
              ),
             );
           }
         );
       }
}