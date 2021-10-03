import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Enviar email de confirmação'),
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
