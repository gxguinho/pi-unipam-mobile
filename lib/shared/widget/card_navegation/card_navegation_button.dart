import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/app_controller.dart';

class CardNavegationButton extends StatelessWidget {


  final String title;
  final IconData icon;
  final String route;

  const CardNavegationButton({ 
    Key? key,
    required this.title,
    required this.icon,
    required this.route
   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () {
          AppController.instance.changeScreen(title, context, route);
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2.5, color: AppController.instance.colorSelected)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 26),
                SizedBox(height: 6),
                Text(title),
              ],
            )),
      ),
    );
  }
}