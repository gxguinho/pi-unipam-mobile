import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/shared/util/modules_list.dart';
import 'package:unipam_mobile/shared/widgets/module_page/module_page.dart';

class LibaryPage extends StatefulWidget {
  const LibaryPage({ Key? key }) : super(key: key);

  @override
  _LibaryPageState createState() => _LibaryPageState();
}

class _LibaryPageState extends State<LibaryPage> {
  @override
  Widget build(BuildContext context) {
    return ModulePage(
      title: "Biblioteca", 
      pages: ModulesListLibrary().libraryModules
    );
  }
}