import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/library/language/language_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({ Key? key }) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  @override
  void initState() {
    super.initState();
    LanguageController.instance.getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: LanguageController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Idiomas", 
          modalTitle: "Idioma", 
          hasAdd: true,
          inputs: LibraryInputs().languageInput, 
          onChangedText: (text, title) => LanguageController.instance.onChangedText(text, title), 
          register: (context) => LanguageController.instance.registerLanguage(context), 
          errors: [], 
          cleanInputs: () => LanguageController.instance.cleanInputs(), 
          animation: LanguageController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], rows: [
                ...LanguageController.instance.languages.map((e) => 
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
                          onPressed: () => LanguageController.instance.deleteLanguage(e['id']), 
                          icon: Icon(Icons.remove_circle)
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