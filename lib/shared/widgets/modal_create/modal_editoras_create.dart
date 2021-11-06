import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/reportspage/reports_controller.dart';
import 'package:unipam_mobile/modules/app/Library/editoras/editoras_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/input_text_create.dart';

class ModalInsertEditoras extends StatefulWidget {
  const ModalInsertEditoras({Key? key}) : super(key: key);

  @override
  _ModalInsertEditorasState createState() => _ModalInsertEditorasState();
}

class _ModalInsertEditorasState extends State<ModalInsertEditoras> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReportsController.instance,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(top: 80),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Cadastre uma Editora", style: AppText.barTitle),
              leading: IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: Icon(Icons.close),
              ),
            ),
            body: Container(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(height: 30),
                  ...InputModalList().editorasInput.map((e) => InputTextCreate(
                        title: e['title'] as String,
                        icon: e['icon'] as IconData,
                        maxLength: e['maxLength'] as int,
                        type: e['type'] as TextInputType,
                        textFormatter: e['textFormater'] as String,
                        onChanged: (text) => EditorasController.instance
                            .changedText(text, e['title'] as String),
                      )),
                  SizedBox(height: 30),
                  LabelButtonNavegation(
                    text: "Salvar",
                    onChanged: (context) =>
                        EditorasController.instance.registerEditoras(context),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
