import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_authors_create.dart';
import 'authors_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({Key? key}) : super(key: key);

  @override
  _AuthorsPageState createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  bool isSearching = false;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    AuthorsController.instance.onChangedText("");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AuthorsController.instance,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: !isSearching
                ? Text("Autores", style: AppText.barTitle)
                : TextField(
                    onChanged: (text) =>
                        AuthorsController.instance.onChangedText(text),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: AppColors.white,
                      ),
                      hintText: "Procure autor",
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
              columnSpacing: 30,
              dataRowHeight: 60,
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data Criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ],
              rows: [
                ...AuthorsController.instance.authors.map(
                  (e) => DataRow(cells: [
                    DataCell(Text(e['nome'].toString())),
                    DataCell(
                      Text(DateFormat("dd/MM/yyyy").format(e['data criação'])),
                    ),
                    DataCell(IconButton(
                        onPressed: () =>
                            AuthorsController.instance.removeItem(e['nome']),
                        icon: Icon(Icons.remove_circle))),
                    DataCell(
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _openModal() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalInsertAuthors();
        });
  }
}
