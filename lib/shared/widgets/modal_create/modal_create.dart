import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/dropdown_create.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/input_text_create.dart';

class ModalCreate extends StatefulWidget {
  const ModalCreate({ Key? key }) : super(key: key);

  @override
  _ModalCreateState createState() => _ModalCreateState();
}

class _ModalCreateState extends State<ModalCreate> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: StudentsController.instance,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(top: 80),
          child: Scaffold(
            appBar: AppBar(
               title: Text(
                 "Novo Aluno",
                 style: AppText.barTitle
               ),
               leading: IconButton(
                 onPressed: () => {
                   Navigator.pop(context),
                   StudentsController.instance.cleanInputs()
                 }, 
                 icon: Icon(Icons.close)
               ),
            ),
            body: Container(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                children: [
                  ...InputModalList().studentsInputs.map((e) => 
                  e['title'] != "Estado civil"
                  && e['title'] != "Sexo"
                  && e['title'] != "Estado" 
                  && e['title'] != "Cidade" 
                  && e['title'] != "Curso"
                  && e['title'] != "Está Trabalhando" 
                  && e['title'] != "Noções de informática" 
                  && e['title'] != "Grupo de usuário" ?
                    InputTextCreate(
                      title: e['title'] as String,
                      icon: e['icon'] as IconData,
                      maxLength: e['maxLength'] as int,
                      type: e['type'] as TextInputType,
                      textFormatter: e['textFormater'] as String,
                      onChanged: (text) => StudentsController.instance.changeText(text,  e['title'] as String),
                    ) : DropdownCreate(
                          title: e['title'] as String,
                          itemsSelect: e["itens"] as List<Map<dynamic, dynamic>>,
                          onChanged: (text) => StudentsController.instance.changeText(text,  e['title'] as String),
                    ),
                  ),
                  
                   LabelButtonNavegation(
                     text: "Cadastrar", 
                     onChanged: (context) => StudentsController.instance.registerStudents(context),
                   ),
                   SizedBox(height: 10),
                ],
              ),
            ),
          )
        );
      }
    );
  }
}
