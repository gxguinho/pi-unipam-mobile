import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/library/publishers/publishers_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class PublishersPage extends StatefulWidget {
  const PublishersPage({ Key? key }) : super(key: key);

  @override
  State<PublishersPage> createState() => _PublishersPageState();
}

class _PublishersPageState extends State<PublishersPage> {
   @override
  void initState() {
    super.initState();
    PublishersController.instance.getPublishers();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: PublishersController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Editoras", 
          modalTitle: "Editor",
          hasAdd: true,
          inputs: LibraryInputs().publisherInputs, 
          onChangedText: (text, title) => PublishersController.instance.onChangedText(text, title), 
          register: (context) => PublishersController.instance.registerPublisher(context), 
          errors: [], 
          cleanInputs: () => PublishersController.instance.cleanInputs(), 
          animation: PublishersController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], rows: [
                ...PublishersController.instance.publishers.map((e) => 
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
                          onPressed: () => PublishersController.instance.deleteAuthor(e['id']), 
                          icon: Icon(Icons.remove_circle)
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