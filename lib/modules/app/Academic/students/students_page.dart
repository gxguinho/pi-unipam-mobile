import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/academic/students/students_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/module_page/module_page.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({ Key? key }) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {

  @override
  void initState() {
    super.initState();
    StudentsController.instance.getStudent();
    StudentsController.instance.getState();
    StudentsController.instance.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
       animation: StudentsController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Alunos", 
          modalTitle: "Aluno", 
          hasAdd: true,
          inputs: AcademicInputs().studentsInputs, 
          onChangedText: (text, title) => StudentsController.instance.onChangedText(text, title), 
          register: (context) => StudentsController.instance.registerStudent(context), 
          errors: [], 
          cleanInputs: () => StudentsController.instance.cleanInputs(), 
          animation: StudentsController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("Detalhes")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], 
              rows: [
                ...StudentsController.instance.students.map((e) => 
                  DataRow(
                    cells: [
                      DataCell(Text(e['name'])),
                      DataCell(Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(e['date'])))),
                      DataCell(
                        IconButton(
                          onPressed: () => _openModal(), 
                          icon: Icon(Icons.details)
                        )
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.edit)
                        )
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () => StudentsController.instance.deleteStudent(e['id']), 
                          icon: Icon(Icons.remove_circle)
                        )
                      ),
                    ]
                  )
                )
              ], 
            )
          )
        );
      }
    );
  }
  _openModal() {
    showDialog(
      context: context,
      builder: (context) {
        return ModulePage(
          title: 'Detalhes', 
          pages: [
            {
              "title": "Frequência",
              "icon": Icons.format_quote,
              "route": "/frequency"
            },
            {
              "title": "Notas",
              "icon": Icons.not_accessible,
              "route": "/notes"
            },
            ],
        );
      }
    );
  }
}