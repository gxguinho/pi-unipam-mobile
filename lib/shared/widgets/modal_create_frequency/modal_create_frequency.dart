import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/models/student.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

class ModalCreateFrequency extends StatefulWidget {
  const ModalCreateFrequency({Key? key}) : super(key: key);

  @override
  _ModalCreateFrequencyState createState() => _ModalCreateFrequencyState();
}

class _ModalCreateFrequencyState extends State<ModalCreateFrequency> {
  
  @override
  Widget build(BuildContext context) {
    
    return AnimatedBuilder(
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.only(top: 80),
            child: Scaffold(
              appBar: AppBar(
                title: Text("Adicionar frequencia", style: AppText.barTitle),
                leading:
                    IconButton(onPressed: () => {}, icon: Icon(Icons.close)),
              ),
              body: Container(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  children: [],
                ),
              ),
            ),
          );
        },
  }
}
