import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/horario/horario_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'dropdown_create.dart';

class ModalHorarioCreate extends StatefulWidget {
  const ModalHorarioCreate({ Key? key }) : super(key: key);

  @override
  _ModalHorarioCreateState createState() => _ModalHorarioCreateState();
}



class _ModalHorarioCreateState extends State<ModalHorarioCreate> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: HorarioController.instance,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(top: 80),
          child: Scaffold(
            appBar: AppBar(
               title: Text(
                 "Novo Horário",
                 style: AppText.barTitle
               ),
               leading: IconButton(
                 onPressed: () => {
                   Navigator.pop(context),
                 }, 
                 icon: Icon(Icons.close)
               ),
            ),
            body: Container(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                children: [
                  ...InputModalList().horarioInputs.map((e) =>  DropdownCreate(
                          title: e['title'] as String,
                          itemsSelect: e["itens"] as List<Map<dynamic, dynamic>>,
                          onChanged: (text) =>HorarioController.instance.onChangeText(text,  e['title'] as String),
                    ),),
                  
                   LabelButtonNavegation(
                     text: "Cadastrar", 
                     onChanged: (context) => HorarioController.instance.handleResgistreHorario(),
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