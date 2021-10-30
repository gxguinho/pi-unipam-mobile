import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/icon_navegation/icon_navegation_button.dart';

class TurmaAbertaPage extends StatefulWidget {
  const TurmaAbertaPage({Key? key}) : super(key: key);

  @override
  _TurmaAbertaState createState() => _TurmaAbertaState();
}

class _TurmaAbertaState extends State<TurmaAbertaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turma Aberta", style: AppText.barTitle),
      ),
      body: Container(
          child: Column(
        children: [
          Card(
            child: Container(
              height: 160,
              width: 1000,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Icon(Icons.school_outlined),
                  Text('Turma Fisioterapia'),
                  Text('Data Inicio: 2020'),
                  Text('Data Final: 2024'),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {},
                    child: Column(
                      children: [Text('Visualizar')],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 160,
              width: 1000,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Icon(Icons.school_outlined),
                  Text('Turma Veterinaria'),
                  Text('Data Inicio: 2019'),
                  Text('Data Final: 2025'),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {},
                    child: Column(
                      children: [Text('Visualizar')],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
