import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/reportspage/reports_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';

class ModalInsertReports extends StatefulWidget {
  final String aluno;

  const ModalInsertReports({Key? key, required this.aluno}) : super(key: key);

  @override
  _ModalInsertReportsState createState() => _ModalInsertReportsState();
}

class _ModalInsertReportsState extends State<ModalInsertReports> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReportsController.instance,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(top: 80),
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text("Relatório de ${widget.aluno}", style: AppText.barTitle),
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
                  Text("Escreva um relatório para o aluno",
                      style: AppText.barTitle),
                  SizedBox(height: 20),
                  TextFormField(
                    minLines: 15,
                    maxLines: 30,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Descrição',
                      hintStyle: TextStyle(color: AppColors.white),
                      hoverColor: AppColors.purple,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onChanged: (text) =>
                        ReportsController.instance.report = text,
                  ),
                  SizedBox(height: 30),
                  LabelButtonNavegation(
                    text: "Salvar",
                    onChanged: (context) => ReportsController.instance
                        .registerReport(context, widget.aluno),
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
