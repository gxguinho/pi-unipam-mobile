import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/manage_curse/manage_curse_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/alert_remove_button/alert_remove_button.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'dropdown_create.dart';
import 'input_text_create.dart';

class ModalCurseCreate extends StatefulWidget {
  ModalCurseCreate({Key? key, required this.isCreate, this.professor, this.nomeCurso, this.quantAlunos}) : super(key: key);

  final bool isCreate;
  final String? professor;
  final String? nomeCurso;
  final String? quantAlunos;

  @override
  _ModalCurseCreateState createState() => _ModalCurseCreateState();
}

class _ModalCurseCreateState extends State<ModalCurseCreate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Scaffold(
         appBar: AppBar(
          title: Text(widget.isCreate ? "Nova Turma" : "Alterar Turma", style: AppText.barTitle),
          leading: IconButton(
              onPressed: () => {
                Navigator.pop(context),
              },
              icon: Icon(Icons.close)),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            children: [
              ...InputModalList().curseInputs.map((e) => 
                e['isDropdown'] != true ? InputTextCreate(
                      title: e['title'] as String,
                      icon: e['icon'] as IconData,
                      maxLength: e['maxLength'] as int,
                      type: e['type'] as TextInputType,
                      textFormatter: e['textFormater'] as String,
                      onChanged: (text) => ManageCurseController.instance.onChangeText(text, e['title'] as String),
                      nomeCurso: widget.nomeCurso,
                      quantAlunos: widget.quantAlunos,
                )
                    : DropdownCreate(
                          title: e['title'] as String,
                          itemsSelect: e["itens"] as List<Map<dynamic, dynamic>>,
                          onChanged: (text) => ManageCurseController.instance.onChangeText(text, e['title'] as String),
                          value: widget.professor,
                    ),
              ),
              LabelButtonNavegation(
                text: widget.isCreate ?  "Cadastrar" : "Salvar", 
                onChanged: (context) => widget.isCreate ? ManageCurseController.instance.handleRegisterCurse(context) : 
                  ManageCurseController.instance.handleEditCurse(widget.nomeCurso, context),
              ),
              SizedBox(height: 20),
              widget.isCreate ? Container() : AlertRemoveButton(
                text: "Excluir Curso", 
                onChanged: (context) => ManageCurseController.instance.handleDeleteCurse(widget.nomeCurso, context),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}