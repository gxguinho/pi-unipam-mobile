import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/library/authors/authors_controller.dart';
import 'package:unipam_mobile/modules/app/library/readers/readers_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/dropdown_create.dart';

import 'input_text_create.dart';

class ModalCreate extends StatelessWidget {
  const ModalCreate({ 
    Key? key, 
    required this.title, 
    required this.inputs, 
    required this.modalTitle, 
    required this.onChangedText, 
    required this.register, 
    required this.errors, required this.cleanInputs, 
    required this.animation, this.controller 
    }) : super(key: key);

  final String title;
  final List inputs;
  final String modalTitle;
  final Function(String, String) onChangedText;
  final Function(BuildContext context) register;
  final Function() cleanInputs;
  final List errors;
  final Listenable animation;
  final String? controller;
  @override
  Widget build(BuildContext context) {
            return Container(
              padding: EdgeInsets.only(top: 80),
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Novo ${modalTitle}", style: AppText.barTitle),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      cleanInputs();
                    }, 
                    icon: Icon(Icons.close)
                  ),
                ),
                body: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...inputs.map((e) => 
                            e['isDropdown'] == false ? 
                            InputTextCreate(
                              title: e['title'] as String,
                              icon: e['icon'] as IconData,
                              maxLength: e['maxLength'] as int,
                              type: e['type'] as TextInputType,
                              textFormatter: e['textFormater'] as String,
                              error: "",
                              isError: errors.map((element) => element['title'] == e['element']).toList(),
                              onChangedText: (text) => onChangedText(text, e['title']),
                              animation: animation,
                              controller: e['controller'],
                            ) : DropdownCreate(
                              title: e['title'] as String, 
                              itemsSelect: e['itens'] as List<Map<dynamic, dynamic>>,
                              onChanged: (text) => onChangedText(text, e['title']),
                              animation: animation,
                            )
                          ),
                          LabelButtonNavegation(
                            text: "Cadastrar",
                            onChanged: (context) => register(context),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
}