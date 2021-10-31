import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/Library/idiomas/idiomas_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_idioma_create.dart';

class IdiomasPage extends StatefulWidget {
  const IdiomasPage({Key? key}) : super(key: key);

  @override
  _IdiomasPageState createState() => _IdiomasPageState();
}

class _IdiomasPageState extends State<IdiomasPage> {
  bool isSearching = false;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    IdiomasController.instance.onChangedText("");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: IdiomasController.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: !isSearching
                  ? Text("Idiomas", style: AppText.barTitle)
                  : TextField(
                      onChanged: (text) =>
                          IdiomasController.instance.onChangedText(text),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: AppColors.white,
                        ),
                        hintText: "Procure Idiomas",
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
                ...IdiomasController.instance.idioma.map(
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
          return ModalInsertIdioma();
        });
  }
}
