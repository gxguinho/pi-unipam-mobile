import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class AlertRemoveButton extends StatelessWidget {
  const AlertRemoveButton({ Key? key, 
  required this.text, 
  required this.onChanged }) : super(key: key);

  final String text;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: AppController.instance.colorSelected == AppColors.red ? AppColors.shape : AppColors.red,
          textStyle: AppText.buttonTitle,
          minimumSize: Size(400, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          onChanged(context);
        });
  }
}