import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/library/authors/authors_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_create.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({ Key? key }) : super(key: key);

  @override
  _AuthorsPageState createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  @override
  void initState() {
    super.initState();
    AuthorsController.instance.getAuthors();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AuthorsController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Autores",
          modalTitle: "Autor",
          hasSearch: true,
          hasAdd: true,
          animation: AuthorsController.instance,
          errors: AuthorsController.instance.errors,
          inputs: LibraryInputs().authorsInput,
          onChangedText: (text, title) => AuthorsController.instance.onChangedText(text, title),
          register: (context) => AuthorsController.instance.registerAuthors(context),
          cleanInputs: () => AuthorsController.instance.cleanInputs(),
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data Criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], rows: [
                ...AuthorsController.instance.authors.map((e) => 
                DataRow(
                  cells: [
                    DataCell(Text(e['name'])),
                    DataCell(Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(e['date'])))),
                    DataCell(
                      IconButton(
                        onPressed: () => _openModal(),
                        icon: Icon(Icons.edit)
                      )
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () => AuthorsController.instance.deleteAuthor(e['id']), 
                        icon: Icon(Icons.remove_circle)
                      )
                    ),
                  ]
                ))
              ],
            )
          ),
        );
      }
    );
  }
      _openModal() {
        showDialog(
          context: context,
          builder: (context) {
            return ModalCreate(
              modalTitle: "Autor",
              inputs: LibraryInputs().authorsInput,
              register: (text) {},
              onChangedText: (text, title) => {},
              errors: [],
              cleanInputs: () {}, 
              animation: AuthorsController.instance, 
              title: 'Autores', 
            );
      });
    }
}