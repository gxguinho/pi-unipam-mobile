import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/alert_remove_button/alert_remove_button.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/dropdown_create.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/input_text_create.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emprestimos", style: AppText.barTitle),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            children: [
              ...LibraryInputs().loanInput.map((e) => e['isDropdown'] == false
                  ? InputTextCreate(
                      title: e['title'] as String,
                      icon: e['icon'] as IconData,
                      maxLength: e['maxLength'] as int,
                      type: e['type'] as TextInputType,
                      textFormatter: e['textFormater'] as String,
                      error: "",
                      isError: []
                          .map((element) => element['title'] == e['element'])
                          .toList(),
                      onChangedText: (text) => {},
                      animation: LoanController.instance,
                      controller: e['controller'],
                    ): DropdownCreate(
                      title: e['title'] as String,
                      itemsSelect: e['itens'] as List<Map<dynamic, dynamic>>,
                      onChanged: (text) => {},
                    )),
              LabelButtonNavegation(
                text: "Buscar",
                onChanged: (context) => LoanController.instance.gerarRelatorio(),
              ),
              SizedBox(height: 10),
              AlertRemoveButton(
                text: "Gerar Relatórios",
                onChanged: (context) => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
