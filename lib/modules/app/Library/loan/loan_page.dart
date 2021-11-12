import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/notas/notes_controller.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/dropdown_create.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/input_text_create.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: AnimatedBuilder(
            animation: LoanController.instance,
            builder: (context, child) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text("Empréstimos"),
                  ),
                  body: Container(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      children: [
                        ...InputModalList()
                            .loan
                            .map((e) => e['isDropdown'] == true
                                ? DropdownCreate(
                                    title: e['title'] as String,
                                    itemsSelect: e["itens"]
                                        as List<Map<dynamic, dynamic>>,
                                    onChanged: (text) =>
                                        NotesController.instance.aluno = text,
                                  )
                                : InputTextCreate(
                                    title: e['title'] as String,
                                    icon: e['icon'] as IconData,
                                    maxLength: e['maxLength'] as int,
                                    type: e['type'] as TextInputType,
                                    textFormatter: e['textFormater'] as String,
                                    onChanged: (text) =>
                                        NotesController.instance.nota = text,
                                  )),
                        LabelButtonNavegation(
                          text: "Buscar",
                          onChanged: (context) =>
                              NotesController.instance.registerNote(context),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ));
            }),
      );
}
