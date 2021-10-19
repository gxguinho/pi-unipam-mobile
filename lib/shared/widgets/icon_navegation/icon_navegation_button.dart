import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class IconNavegationButton extends StatelessWidget {

  final String title;
  final IconData icon;
  final String route;
  
  const IconNavegationButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.route
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: AppText.iconNavegation,
            )
          ],
        ),
      ),
    );
  }
}
