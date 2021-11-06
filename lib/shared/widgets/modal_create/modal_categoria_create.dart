import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unipam_mobile/modules/app/Academic/reportspage/reports_controller.dart';
import 'package:unipam_mobile/modules/app/Library/categoria/categoria_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'input_text_create.dart';

class ModalInsertCategoria extends StatefulWidget {
  const ModalInsertCategoria({Key? key}) : super(key: key);

  @override
  _ModalInsertCategoriaState createState() => _ModalInsertCategoriaState();
}

class _ModalInsertCategoriaState extends State<ModalInsertCategoria> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReportsController.instance,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(top: 80),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Cadastre uma categoria", style: AppText.barTitle),
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
                  ...InputModalList().categoriaInput.map((e) => InputTextCreate(
                        title: e['title'] as String,
                        icon: e['icon'] as IconData,
                        maxLength: e['maxLength'] as int,
                        type: e['type'] as TextInputType,
                        textFormatter: e['textFormater'] as String,
                        onChanged: (text) => CategoriaController.instance
                            .changedText(text, e['title'] as String),
                      )),
                  SizedBox(height: 30),
                  LabelButtonNavegation(
                    text: "Salvar",
                    onChanged: (context) =>
                        CategoriaController.instance.registerCategoria(context),
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
