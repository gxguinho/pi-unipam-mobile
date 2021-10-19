import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_controller.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class InputTextCreate extends StatelessWidget {

  final String title;
  final IconData icon;
  final int maxLength;
  final Function(String)? onChanged;
  final TextInputType type;
  final String textFormatter;

  const InputTextCreate({
     Key? key, 
     required this.title, 
     required this.icon,
     this.onChanged, 
     required this.maxLength, 
     required this.type, 
     required this.textFormatter }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: TextEditingController(text: 
          title == 'Logradouro' ? StudentsController.instance.logradouro : 
          title == 'Bairro' ? StudentsController.instance.bairro : title == 'Complemento' ? StudentsController.instance.complemento : title == 'CEP' ? StudentsController.instance.cep : null
        ),
        onChanged: (text) => onChanged!(text),
        style: AppText.inputText,
        keyboardType: type,
        maxLength: maxLength == 0 ? null : maxLength,
        inputFormatters: [
          new MaskTextInputFormatter(mask:  textFormatter, filter: {"#": RegExp(r'[0-9]')})
        ],
        decoration: InputDecoration(
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
}