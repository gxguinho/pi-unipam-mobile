import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class TextInputAuth extends StatefulWidget {

  final String type;
  final Function(String) onChanged;
  const TextInputAuth({Key? key, required this.type, required this.onChanged }) : super(key: key);

  @override
  _TextInputAuthState createState() => _TextInputAuthState();
}

class _TextInputAuthState extends State<TextInputAuth> {

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) => {
        widget.onChanged(text)
      },
      style: AppText.inputText,
      obscureText: widget.type == "Senha" ? isHiddenPassword : false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.type == "Email" ? Icons.email : Icons.security,
          color: AppColors.white,
        ),
        suffixIcon: widget.type == "Senha" ? InkWell(
          onTap: _togglePasswordView,
          child: Icon(
            isHiddenPassword ? Icons.visibility_off : Icons.visibility,
            color: AppColors.white,
          ),
         ) : null,
        labelText: widget.type,
        labelStyle: AppText.input,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: 2
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.purple.withOpacity(0.6), 
            width: 1
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.purple,
            width: 2
          )
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
