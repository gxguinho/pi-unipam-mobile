import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/academic/students/students_controller.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
       animation: StudentsController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Alunos", 
          modalTitle: "Aluno", 
          inputs: [], 
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
}