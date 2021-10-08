import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';

class TextInput1 extends StatelessWidget {
  final String type;
  const TextInput1({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: (text) {
          print(text);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary)),
            prefixIcon: Icon(
              Icons.email,
              color: AppColors.white,
            ),
            labelText: (type),
            labelStyle: TextStyle(color: AppColors.white),
            border: OutlineInputBorder()),
      ),
    );
  }
}
