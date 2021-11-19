import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

import 'modules_controller.dart';

class ModulesPage extends StatefulWidget {
  const ModulesPage({ Key? key }) : super(key: key);

  @override
  _ModulesPageState createState() => _ModulesPageState();
}

class _ModulesPageState extends State<ModulesPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
       animation: ModulesController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Módulos", 
          modalTitle: "Módulo",
          hasAdd: true,
          inputs: AcademicInputs().modulesInput,
          onChangedText: (text, title) =>  ModulesController.instance.onChangedText(text, title), 
          register: (context) => ModulesController.instance.registerModule(context), 
          errors: [], 
          cleanInputs: () => ModulesController.instance.cleanInputs(), 
          animation: ModulesController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
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
                          onPressed: () {}, 
                          icon: Icon(Icons.edit)
                        )
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () => ModulesController.instance.deleteModule(e['id']), 
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