import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/academic/classes/classes_controller.dart';
import 'package:unipam_mobile/modules/app/academic/students/students_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/util/modules_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class OpenClass extends StatefulWidget {
  const OpenClass({ Key? key }) : super(key: key);

  @override
  _OpenClassState createState() => _OpenClassState();
}

class _OpenClassState extends State<OpenClass> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ClassesController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Turmas emAberto", 
          hasAdd: true,
          modalTitle: "Turma", 
          inputs: AcademicInputs().classInput, 
          onChangedText: (text, title) => ClassesController.instance.onChangedTextOpen(text, title),
          register: (context) => ClassesController.instance.registerOpenClass(context), 
          errors: [], 
          cleanInputs: () => ClassesController.instance.cleanInputsOpen(), 
          animation: ClassesController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], 
              rows: [
                ...ClassesController.instance.classOpen.map((e) => 
                  DataRow(
                    cells: [
                      DataCell(Text(e['nomeTurma'])),
                      DataCell(Text(DateFormat("dd/MM/yyyy").format(e['date']))),
                      DataCell(
                        IconButton(
                          onPressed: () => ClassesController.instance.registerClosedClass(e['id'],e['nomeTurma'],e['date']), 
                          icon: Icon(Icons.edit)
                        )
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () => ClassesController.instance.deleteClass(e['id']), 
                          icon: Icon(Icons.delete)
                        )
                      ),
                    ]
                  )
                )
              ], 
            ),
          ), 
        );
      }
    );
  }
}