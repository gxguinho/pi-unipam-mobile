import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class LabelButtonNavegation extends StatelessWidget {

  final String text;
  final String route;

  const LabelButtonNavegation({
    Key? key, 
    required this.text, 
    required this.route
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: AppColors.purple,
          textStyle: AppText.buttonTitle,
          minimumSize: Size(400, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        });
  }
}