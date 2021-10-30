import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/icon_navegation/icon_navegation_button.dart';

class TurmaFechadaPage extends StatefulWidget {
  const TurmaFechadaPage({Key? key}) : super(key: key);

  @override
  _TurmaFechadaState createState() => _TurmaFechadaState();
}

class _TurmaFechadaState extends State<TurmaFechadaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turma Fechada", style: AppText.barTitle),
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
                  Icon(Icons.school),
                  Text('Turma Fisioterapia'),
                  Text('Data Inicio: 2015'),
                  Text('Concluida em: 2020'),
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
                  Icon(Icons.school),
                  Text('Turma Veterinaria'),
                  Text('Data Inicio: 2015'),
                  Text('Concluida em: 2020'),
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
