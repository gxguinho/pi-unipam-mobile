import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/books/books_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'dropdown_create.dart';
import 'input_text_create.dart';

class ModalCreateBook extends StatelessWidget {
  const ModalCreateBook({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: BooksController.instance,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.only(top: 80),
            child: Scaffold(
               appBar: AppBar(
                title: Text("Novo Aluno", style: AppText.barTitle),
                leading: IconButton(
                    onPressed: () => {
                          Navigator.pop(context),
                          BooksController.instance.cleanInputs()
                    },
                  icon: Icon(Icons.close)),
              ),
              body: Container(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  children: [
                    ...InputModalList().booksInput.map(
                      (e) => e['isDropdown'] != true
                        ? InputTextCreate(
                          title: e['title'] as String,
                          icon: e['icon'] as IconData,
                          maxLength: e['maxLength'] as int,
                          type: e['type'] as TextInputType,
                          textFormatter: e['textFormater'] as String,
                          onChanged: (text) => BooksController.instance.changedText(text,  e['title'] as String),
                        ) : DropdownCreate(
                            title: e['title'] as String,
                            itemsSelect:
                            e["itens"] as List<Map<dynamic, dynamic>>,
                            onChanged: (text) => BooksController.instance.changedText(text,  e['title'] as String),
                        ),
                    ),
                    LabelButtonNavegation(
                      text: "Cadastrar",
                      onChanged: (context) => BooksController.instance.registerBook(context)
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
    });
  }
}