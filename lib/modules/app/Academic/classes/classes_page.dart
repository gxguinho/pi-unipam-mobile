import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/card_navegation/card_navegation_button.dart';
import 'package:unipam_mobile/shared/widgets/module_page/module_page.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModulePage(
      title: "Turmas", 
      pages: [
        {
          "title": "Turmas em Aberto",
          "icon": Icons.people_alt_outlined,
          "route": "/openClass"
        },
        {
          "title": "Turmas Finalizadas",
          "icon": Icons.analytics_outlined,
          "route": "/closedClass"
        },
      ],
    );
  }
}