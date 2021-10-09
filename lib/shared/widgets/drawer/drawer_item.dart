import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  
  const DrawerItem({Key? key, 
  required this.title, 
  required this.icon,
  required this.route
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon, 
        color: AppColors.white
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.white,
          fontWeight: title == AppController.instance.pageSelect ? FontWeight.bold : FontWeight.normal 
        ),
      ),
      onTap: () => {
        title == "Sair" ? _confirmLogout(context) : AppController.instance.changeScreen(title, context, route)
      },
      enabled: true,
      selected: title == AppController.instance.pageSelect,
      selectedTileColor: Colors.white24
    );
    
  }
   
}
   _confirmLogout(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Sair da conta?"),
          content: Text("Deseja Realmente Sair?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), child: Text(
                "Não",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
                )
            ),
            TextButton(
              onPressed: () => AppController.instance.logout(context),
              child: Text(
                "Sim",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
              )
            ),
          ],
          elevation: 24.0,
          backgroundColor: AppController.instance.colorSelected,
          titleTextStyle: AppText.alertTitle,
          contentTextStyle: AppText.alertContent,
        );
      });
  }