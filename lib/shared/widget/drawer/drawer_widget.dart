import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/colors_theme.dart';
import 'package:unipam_mobile/shared/util/pages_list.dart';
import 'package:unipam_mobile/shared/widget/drawer/drawer_item.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppController.instance.colorSelected,
        child: ListView(
          children: [
             UserAccountsDrawerHeader(
                accountName: Text(
                  "Gabriel",
                  style: AppText.NameUser
                ), 
                accountEmail: Text(
                  "gabriel@gmail.com",
                   style: AppText.EmailUser 
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network("https://avatars.githubusercontent.com/u/80070421?v=4"),
                ),
              ),
              Divider(color: AppColors.white),
              ...PagesList().list.map((e) => 
                DrawerItem(
                   title: e['title'] as String,
                   icon: e['icon'] as IconData,
                   route: e['route'] as String,
                )
              ),
              Divider(color: AppColors.white),
              DrawerItem(title: "Sair", icon: Icons.logout, route: ""),
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(top: 10, right: 20),
                  child: CircleAvatar(
                    backgroundColor: AppController.instance.isDarkTheme ? AppColors.white : AppColors.shape,
                    radius: 25,
                    child: IconButton(
                      onPressed: () => _onButtonPress(), 
                      icon: Icon(Icons.settings),
                      iconSize: 32,
                      color: AppController.instance.colorSelected,
                    ),
                  ),
                )
          ],
        ),
      ),
    );
    
  }
  
  void _onButtonPress() {
    showModalBottomSheet(context: context, builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Theme Mode",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color: AppController.instance.isDarkTheme ? Colors.black : Colors.white ,
                size: 34,
              ),
              title: Text(
                AppController.instance.isDarkTheme ? "Tema Preto" : "Tema Branco" ,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal
                ),
              ),
              onTap: () {
                AppController.instance.changeTheme();
              },
            ),
            ListTile(
              title: Text(
                "Theme Colors", 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...ColorsList().list.map((e) => 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: AppController.instance.colorSelected == e['color'] as Color ? e['colorBG'] as Color : e['color'] as Color,
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle, 
                          color: e['color'] as Color,
                          size: 38
                        ),
                        Visibility(
                          visible: AppController.instance.colorSelected == e['color'] as Color,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      ]),
                    title: Text(
                      e['title'] as String, 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      AppController.instance.changeColor(e['color'] as Color);
                    }
                  ),
                ),
              )
            )
          ],
        ),
      );
    });
  }

}
 