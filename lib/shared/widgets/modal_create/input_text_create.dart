import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
                  title == 'Logradouro' ? controller == "ReadersController" ? ReadersController.instance.logradouro : null : 
                  title == 'Bairro' ? controller == "ReadersController" ? ReadersController.instance.bairro : null : 
                  title == 'Complemento' ? controller == "ReadersController" ? ReadersController.instance.complemento : null : 
                  title == 'CEP' ? controller == "ReadersController" ? ReadersController.instance.cep : null  
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