import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_create.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {

  @override
  void initState() {
    super.initState();
    StudentsController.instance.getState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alunos", style: AppText.barTitle),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list,
                size: 30,
              )),
          IconButton(
              onPressed: () => _openModal(),
              icon: Icon(
                Icons.add_circle,
                size: 32,
              )),
        ],
      ),
      body: DataTable(
        columnSpacing: 34, 
        dataRowHeight: 60, 
        columns: [
          DataColumn(label: Text("Nome")),
          DataColumn(label: Text("Data de criação"), numeric: true),
          DataColumn(label: Text("")),
          DataColumn(label: Text("")),
        ], 
        rows: [
          ...StudentsController.instance.students.map((e) => 
            DataRow(
            cells: [
              DataCell(Text(e['name'])),
              DataCell(Text(e['date'].toString())),
              DataCell(IconButton(
                  onPressed: () {
                    print("remove");
                  },
                  icon: Icon(Icons.remove_circle))),
              DataCell(IconButton(
                  onPressed: () {
                    print("Edit");
                  },
                  icon: Icon(Icons.edit)))
            ],
          ),
          )
        ]
      ),
    );
  }

  _openModal() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalCreate();
        });
  }
}
