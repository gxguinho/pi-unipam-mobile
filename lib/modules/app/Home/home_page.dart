import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/pages_list.dart';
import 'package:unipam_mobile/shared/widgets/card_navegation/card_navegation_button.dart';
import 'package:unipam_mobile/shared/widgets/drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Módulos", style: AppText.barTitle),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child:  ListView(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          children: [
            ...PagesList().list.map((e) =>  
              CardNavegationButton(
                title: e['title'] as String,
                icon: e['icon'] as IconData,
                route: e['route'] as String,
             )
            ).where((element) => element.title != "Modulos")
          ],
        )
     ),
    );
  }
}