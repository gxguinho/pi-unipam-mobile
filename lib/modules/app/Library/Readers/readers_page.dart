import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'readers_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_readers_create.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';

class ReadersPage extends StatefulWidget {
  const ReadersPage({Key? key}) : super(key: key);

  @override
  _ReadersPageState createState() => _ReadersPageState();
}

class _ReadersPageState extends State<ReadersPage> {
  bool isSearching = false;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    ReadersController.instance.onChangedText("");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ReadersController.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: !isSearching
                  ? Text("Leitores", style: AppText.barTitle)
                  : TextField(
                      onChanged: (text) =>
                          ReadersController.instance.onChangedText(text),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: AppColors.white,
                        ),
                        hintText: "Procure leitor",
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
            body: ScrollableWidget(
              child: DataTable(
                columns: [
                  DataColumn(label: Text("Nome")),
                  DataColumn(label: Text("Tipo")),
                  DataColumn(label: Text("Celular"), numeric: true),
                  DataColumn(label: Text("Data Criação")),
                  DataColumn(label: Text("")),
                  DataColumn(label: Text("")),
                ],
                rows: [
                  ...ReadersController.instance.readers.map(
                    (e) => DataRow(cells: [
                      DataCell(Text(e['nome'].toString())),
                      DataCell(Text(e['tipo'])),
                      DataCell(Text(e['telefone'])),
                      DataCell(
                        Text(DateFormat("dd/MM/yyyy").format(e['data criação'])),
                      ),
                      DataCell(IconButton(
                          onPressed: () =>
                              ReadersController.instance.removeItem(e['nome']),
                          icon: Icon(Icons.remove_circle))),
                      DataCell(
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
                    ]),
                  )
                ],
              ),
            ),
          );
        });
  }

  _openModal() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalInsertReaders();
        });
  }
}