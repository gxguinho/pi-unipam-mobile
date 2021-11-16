import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/academic/courses/courses_controller.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({ Key? key }) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CoursesController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Cursos", 
          modalTitle: "Curso",
          inputs: [],
          hasAdd: true,
          onChangedText: (text, title) => CoursesController.instance.onChangedText(text, title), 
          register: (context) => CoursesController.instance.registerCourses(context), 
          errors: [], 
          cleanInputs: () => CoursesController.instance.cleanInputs(), 
          animation: CoursesController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], 
              rows: [],
            )
          ), 
        );
      }
    );
  }
}