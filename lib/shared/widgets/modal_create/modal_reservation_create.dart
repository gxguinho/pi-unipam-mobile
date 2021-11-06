import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/reservations/reservations_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

import 'dropdown_create.dart';

class ModalReservationCreate extends StatelessWidget {
  const ModalReservationCreate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              children: [
                ...InputModalList().ReservationInputs.map((e) => 
                    DropdownCreate(
                      title: e['title'] as String,
                      itemsSelect:
                      e["itens"] as List<Map<dynamic, dynamic>>,
                      onChanged: (text) => ReservationsController.instance.changedText(text,  e['title'] as String),
                    ),
                ),
                LabelButtonNavegation(
                      text: "Cadastrar",
                      onChanged: (context) => ReservationsController.instance.registerBook(context)
                    ),
                    SizedBox(height: 10),
              ],
              
            ),
        )
      ),
    );
  }
}