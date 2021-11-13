import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/notas/notes_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'dropdown_create.dart';
import 'input_text_create.dart';

class ModalNotesCreate extends StatefulWidget {
  const ModalNotesCreate({Key? key}) : super(key: key);

  @override
  _ModalNotesCreateState createState() => _ModalNotesCreateState();
}

class _ModalNotesCreateState extends State<ModalNotesCreate> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: NotesController.instance,
        builder: (context, child) {
          return Container(
              padding: EdgeInsets.only(top: 80),
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Nova Nota", style: AppText.barTitle),
                  leading: IconButton(
                      onPressed: () => {
                            Navigator.pop(context),
                            NotesController.instance.cleanInputs()
                          },
                      icon: Icon(Icons.close)),
                ),
                body: Container(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    children: [
                      ...InputModalList()
                          .noteInputs
                          .map((e) => e['isDropdown'] == true
                              ? DropdownCreate(
                                  title: e['title'] as String,
                                  itemsSelect:
                                      e["itens"] as List<Map<dynamic, dynamic>>,
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
                        text: "Cadastrar",
                        onChanged: (context) =>
                            NotesController.instance.registerNote(context),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ));
        });
  }
}
