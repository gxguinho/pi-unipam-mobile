import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';

class LabelButton extends StatelessWidget {
  final String text;
  const LabelButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        side: BorderSide(color: Colors.black, width: 1),
                 minimumSize: Size(400,50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {},
    );
  }
}
