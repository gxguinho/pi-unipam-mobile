import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/modules_list_library.dart';
import 'package:unipam_mobile/shared/widgets/drawer/drawer_widget.dart';
import 'package:unipam_mobile/shared/widgets/icon_navegation/icon_navegation_button.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Biblioteca", style: AppText.barTitle),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                ...ModulesList().academicModules.map(
                      (e) => IconNavegationButton(
                        title: e['title'] as String,
                        icon: e['icon'] as IconData,
                        route: e['route'] as String,
                      ),
                    ),
              ],
            ),
          )),
    );
  }
}
