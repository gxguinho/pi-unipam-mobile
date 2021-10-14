import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/input_text_create.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/select_dropdown_create.dart';

class ModalCreate extends StatefulWidget {
  const ModalCreate({ Key? key }) : super(key: key);

  @override
  _ModalCreateState createState() => _ModalCreateState();
}

class _ModalCreateState extends State<ModalCreate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Scaffold(
       appBar: AppBar(
         title: Text(
           "Novo Aluno",
           style: AppText.barTitle
         ),
         leading: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: Icon(Icons.close)
         ),
       ),
       body: Container(
         child: ListView(
           padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
           children: [
             ...InputModalList().studentsInputs.map((e) => 
                e['title'] != "Sexo"
                 && e['title'] != "Estado civil" 
                 && e['title'] != "Estado" 
                 && e['title'] != "Cidade" 
                 && e['title'] != "Curso"
                 && e['title'] != "Está Trabalhando" 
                 && e['title'] != "Noções de informática" 
                 && e['title'] != "Grupo de usuário" ? InputTextCreate(
                  title: e['title'] as String,
                  icon: e['icon'] as IconData,
                  maxLength: e['maxLength'] as int,
                  type: e['type'] as TextInputType,
                  onChanged: (text) => StudentsController.instance.changeInputText(text, e['title'] as String),
                ) : SelectDropDownCreate(
                  itemsSelect: e["itens"] as List<String>,
                  title: e['title'] as String,
                )
             ),
             SizedBox(height: 20),
             LabelButtonNavegation(
               text: "Cadastrar", 
               onChanged: () => StudentsController.instance.handleRegisterStudents()
             ),
             SizedBox(height: 10),
           ],
         ),
       ),
      ),
    );
  }
}