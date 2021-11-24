import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

import 'frequency_controller.dart';

class FrequencyPage extends StatelessWidget {
  const FrequencyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: FrequencyController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Frequencias", 
          modalTitle: "Frequencia", 
          inputs: [],
          hasAdd: true,
          onChangedText: (text, title) => FrequencyController.instance.onChangedText(text, title), 
          register: (context) => FrequencyController.instance.registerFrequency(context), 
          errors: [], 
          cleanInputs: () => FrequencyController.instance.cleanInputs(), 
          animation: FrequencyController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Total de aulas")),
                DataColumn(label: Text("Total de presenças")),
                DataColumn(label: Text("Total de faltas")),
                DataColumn(label: Text("Frequência (%)")),
              ], 
              rows: [],
            )
          ), 
        );
      }
    );
  }
}