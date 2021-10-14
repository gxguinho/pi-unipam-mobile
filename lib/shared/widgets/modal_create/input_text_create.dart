import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class InputTextCreate extends StatelessWidget {
  final String title;
  final int maxLength;
  final IconData icon;
  final TextInputType type;
  final Function(String)? onChanged;

  const InputTextCreate(
      {Key? key,
      required this.title,
      required this.maxLength,
      required this.icon,
      required this.type,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
          inputFormatters: [
            new MaskTextInputFormatter(
                mask: '#####-###', filter: {"#": RegExp(r'[0-9]')})
          ],
          onChanged: onChanged == null ? null : (text) => onChanged!(text),
          keyboardType: type,
          style: AppText.inputText,
          maxLength: maxLength == 0 ? null : null,
          decoration: InputDecoration(
            labelText: title,
            labelStyle: AppText.input,
            //errorText: "campo de texto obrigatório",
            prefixIcon: Icon(
              icon,
              color: AppColors.white,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppController.instance.colorSelected, width: 2)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppController.instance.colorSelected.withOpacity(0.2),
                  width: 2),
            ),
          )),
    );
  }
}
