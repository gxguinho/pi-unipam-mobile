import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/academic/modules/modules_controller.dart';
import 'package:unipam_mobile/modules/app/academic/notes/notes_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({ Key? key }) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: NotesController.instance, 
      builder: (context, child) {
          return TablePage(
          title: "Notas", 
          modalTitle: "Módulo",
          inputs: [],
          onChangedText: (text, title) =>  {}, 
          register: (context) => {}, 
          errors: [], 
          cleanInputs: () => {}, 
          animation: ModulesController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
              ], 
              rows: [
                ...ModulesController.instance.modules.map((e) => 
                  DataRow(
                    cells: [
                      DataCell(Text(e['name'])),
                      DataCell(Text(DateFormat("dd/MM/yyyy").format(e['date']))),
                      DataCell(
                        IconButton(
                          onPressed: () => {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotePage(modulo: e['name']))),
                            NotesController.instance.noteFilter(e['name'])
                          }, 
                          icon: Icon(Icons.add)
                        )
                      ),
                    ]
                  )
                )
              ],
            )
          ), 
        );
      }
      );
    }
}

class NotePage extends StatefulWidget {
  const NotePage({ Key? key, required this.modulo }) : super(key: key);
  final String modulo;
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: NotesController.instance, 
        builder: (context, child) {
        return TablePage(
          title: "Notas", 
          modalTitle: "Nota", 
          inputs: AcademicInputs().notesInput,
          hasAdd: true,
          onChangedText: (text, title) => NotesController.instance.onChangedText(text, title), 
          register: (context) => NotesController.instance.registerNote(context, widget.modulo), 
          errors: [], 
          cleanInputs: () => NotesController.instance.cleanInputs(), 
          animation: NotesController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome da atividade")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], 
              rows: [
                ...NotesController.instance.noteFiltered.map((e) => 
                  DataRow(
                    cells: [
                      DataCell(Text(e['name'])),
                      DataCell(
                          Text(e['date'])),
                      DataCell(
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
                      DataCell(IconButton(
                          onPressed: () =>
                              NotesController.instance.deleteNote(e['id']),
                          icon: Icon(Icons.remove_circle))),
                    ],
                  )
                )
              ]
            )
          ), 
        );
      }
    );
  }
}