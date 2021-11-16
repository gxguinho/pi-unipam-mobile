import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/shared/util/modules_list.dart';
import 'package:unipam_mobile/shared/widgets/module_page/module_page.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({ Key? key }) : super(key: key);

  @override
  _AcademicPageState createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  @override
  Widget build(BuildContext context) {
    return ModulePage(
      title: 'Academico', 
      pages: ModulesListAcademic().academicModules,
    );
  }
}