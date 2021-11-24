import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/drawer/drawer_widget.dart';
import 'package:unipam_mobile/shared/widgets/icon_navegation/icon_navegation_button.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({ Key? key, required this.title, required this.pages }) : super(key: key);

  final String title;
  final List pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: title == "Detalhees" ? DrawerWidget() : null,
      appBar: AppBar(
        title: Text(title, style: AppText.barTitle),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
           child: GridView.count(
             crossAxisCount: 2,
             children: [
               ...pages.map((e) => 
                IconNavegationButton(
                  title: e['title'] as String,
                  icon: e['icon'] as IconData,
                  route: e['route'] as String,
                )
               )
             ],
           )
        ),
      )
    );
  }
}