import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/library/readers/readers_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class ReadersPage extends StatefulWidget {
  const ReadersPage({ Key? key }) : super(key: key);

  @override
  _ReadersPageState createState() => _ReadersPageState();
}

class _ReadersPageState extends State<ReadersPage> {

  @override
  void initState() {
    super.initState();
    ReadersController.instance.getReaders();
  }
  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReadersController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Leitores", 
          modalTitle: "Leitor",
          hasAdd: true,
          inputs: LibraryInputs().readersInput,  
          onChangedText: (text, title) => ReadersController.instance.onChangedText(text, title), 
          register: (context) => ReadersController.instance.registerReader(context), 
          errors: [], 
          cleanInputs: () => ReadersController.instance.cleanInput(), 
          animation: ReadersController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columnSpacing: 30,
              dataRowHeight: 60,
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Tipo")),
                DataColumn(label: Text("Celular")),
                DataColumn(label: Text("Data Criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], rows: [
                ...ReadersController.instance.readers.map((e) => 
                  DataRow(
                    cells: [
                      DataCell(Text(e['name'])),
                      DataCell(Text("")),
                      DataCell(Text(e['phone_number'])),
                      DataCell(Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(e['date'])))),
                      DataCell(
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.edit)
                        )
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () => ReadersController.instance.deleteReaders(e['id']), 
                          icon: Icon(Icons.remove_circle)
                        )
                      ),
                    ]
                ))
              ],
          ), 
        ));
      }
    );
  }
}