import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/Library/editoras/editoras_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_editoras_create.dart';

class EditorasPage extends StatefulWidget {
  const EditorasPage({Key? key}) : super(key: key);

  @override
  _EditorasPageState createState() => _EditorasPageState();
}

class _EditorasPageState extends State<EditorasPage> {
  bool isSearching = false;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    EditorasController.instance.onChangedText("");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: EditorasController.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: !isSearching
                  ? Text("Editoras", style: AppText.barTitle)
                  : TextField(
                      onChanged: (text) =>
                          EditorasController.instance.onChangedText(text),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: AppColors.white,
                        ),
                        hintText: "Procura Editoras",
                      ),
                    ),
              actions: [
                isSearching
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            this.isSearching = !this.isSearching;
                          });
                        },
                        icon: Icon(Icons.cancel, size: 30),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            this.isSearching = !this.isSearching;
                          });
                        },
                        icon: Icon(Icons.search, size: 30),
                      ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list, size: 30),
                ),
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
                DataColumn(label: Text("Data Criação")),
              ],
              rows: [
                ...EditorasController.instance.editoras.map(
                  (e) => DataRow(cells: [
                    DataCell(Text(e['nome'])),
                    DataCell(
                      Text(DateFormat("dd/MM/yyyy").format(e['data criação'])),
                    ),
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
          return ModalInsertEditoras();
        });
  }
}
