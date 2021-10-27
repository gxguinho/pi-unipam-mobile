import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/reportspage/reports_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class ModalReports extends StatefulWidget {
  final String aluno;
  final String descricao;

  const ModalReports({Key? key, required this.aluno, required this.descricao})
      : super(key: key);

  @override
  _ModalReportsState createState() => _ModalReportsState();
}

class _ModalReportsState extends State<ModalReports> {
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
                  Text(
                    widget.descricao,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
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
