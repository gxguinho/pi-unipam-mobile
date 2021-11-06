import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unipam_mobile/modules/app/Academic/reportspage/reports_controller.dart';
import 'package:unipam_mobile/modules/app/Library/Authors/authors_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'input_text_create.dart';

class ModalInsertAuthors extends StatefulWidget {
  const ModalInsertAuthors({Key? key}) : super(key: key);

  @override
  _ModalInsertAuthorsState createState() => _ModalInsertAuthorsState();
}

class _ModalInsertAuthorsState extends State<ModalInsertAuthors> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReportsController.instance,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(top: 80),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Cadastre um autor", style: AppText.barTitle),
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
                  ...InputModalList().autoresInput.map(
                        (e) => InputTextCreate(
                          title: e['title'] as String,
                          icon: e['icon'] as IconData,
                          maxLength: e['maxLength'] as int,
                          type: e['type'] as TextInputType,
                          textFormatter: e['textFormater'] as String,
                          onChanged: (text) => AuthorsController.instance
                              .changedText(text, e['title'] as String),
                        ),
                      ),
                  SizedBox(height: 30),
                  LabelButtonNavegation(
                    text: "Salvar",
                    onChanged: (context) =>
                        AuthorsController.instance.registerAuthors(context),
                  ),
                  SizedBox(height: 30),
                  LabelButtonNavegation(
                    text: "Cancelar",
                    onChanged: (context) => {Navigator.pop(context)},
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
