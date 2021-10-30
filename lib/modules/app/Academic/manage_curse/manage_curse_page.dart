import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/manage_curse/manage_curse_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/card_curse/card_curse.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_curse_create.dart';

class ManageCursePage extends StatefulWidget {
  const ManageCursePage({ Key? key}) : super(key: key);

  @override
  _ManageCursePageState createState() => _ManageCursePageState();
}

class _ManageCursePageState extends State<ManageCursePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ManageCurseController.instance,
      builder: (child, context) {
        bool isCreate;
        return Scaffold(
          appBar: AppBar(
            title: Text("Cursos", style: AppText.barTitle),
            actions: [
              IconButton(
                onPressed: () => _openModal(isCreate = true),
                icon: Icon(
                Icons.add_circle,
                size: 32,
              )),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ...ManageCurseController.instance.courses.map((e) => 
                  CardCurse(
                    nomeCurso: e['nomeCurso'],
                    professor: e['professor'],
                    quantAlunos: e['quantAlunos'],
                    onTap: () => _openModal(
                      isCreate = false,  
                      nomeCurso: e['nomeCurso'],
                      professor: e['professor'],
                      quantAlunos: e['quantAlunos']
                    ),
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }
   _openModal(bool isCreate, { String? nomeCurso, String? professor, String? quantAlunos}) {
    showDialog(
      context: context,
      builder: (context) {
        return ModalCurseCreate(isCreate: isCreate, nomeCurso: nomeCurso, professor: professor, quantAlunos: quantAlunos);
    });
  }
}