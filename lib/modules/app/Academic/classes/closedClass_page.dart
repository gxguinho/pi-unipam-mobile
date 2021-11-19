import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/academic/classes/classes_controller.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class ClosedClass extends StatefulWidget {
  const ClosedClass({ Key? key }) : super(key: key);

  @override
  State<ClosedClass> createState() => _ClosedClassState();
}

class _ClosedClassState extends State<ClosedClass> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ClassesController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Turmas Finalizadas", 
          modalTitle: "Turma", 
          inputs: [], 
          onChangedText: (text, title) => {}, 
          register: (context) => {}, 
          errors: [], 
          cleanInputs: () => {}, 
          animation: ClassesController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("Data de finalização")),
              ], 
              rows: [
                ...ClassesController.instance.classClosed.map((e) => 
                  DataRow(
                    cells: [
                      DataCell(Text(e['nomeTurma'])),
                      DataCell(Text(e['date'])),
                      DataCell(Text(DateFormat("dd/MM/yyyy").format(e['dateFinalizacao']))),
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