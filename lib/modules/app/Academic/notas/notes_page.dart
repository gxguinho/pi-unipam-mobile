import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/notas/notes_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_notes_create.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: NotesController.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Notas", style: AppText.barTitle),
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
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Nota"), numeric: true),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ],
              rows: [
                ...NotesController.instance.notes.map(
                  (e) => DataRow(cells: [
                    DataCell(Text(e['aluno'])),
                    DataCell(Text(e['note'].toString())),
                    DataCell(IconButton(
                        onPressed: () =>
                            NotesController.instance.removeItem(e['name']),
                        icon: Icon(Icons.remove_circle))),
                    DataCell(
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)))
                  ]),
                )
              ],
            ),
          );
        });
  }

  _openModal() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalNotesCreate();
        });
  }
}
