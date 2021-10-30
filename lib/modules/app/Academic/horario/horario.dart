import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/horario/horario_controller.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_horario_create.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HorarioPage(),
  ));
}

class HorarioPage extends StatefulWidget {
  const HorarioPage({Key? key}) : super(key: key);

  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: HorarioController.instance,
      builder: (context, child) { return Scaffold(
        appBar: AppBar(title: Text('Horário'), actions:[ IconButton(
                      onPressed: () => _openModal(),
                      icon: Icon(
                        Icons.add_circle,
                        size: 32,
                      )),]),
        body: Center(
          child: ListView(
            children: [

             ...HorarioController.instance.horariototal.map((e) =>

              DataTable(columns: [
                DataColumn(label: Text(e['DiaSemana'])),
                DataColumn(label: Text(''))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text(e['Horario1'])),
                  DataCell(Text(e['Materia1'])),
                ]),
                DataRow(cells: [
                  DataCell(Text(e['Horario2'])),
                  DataCell(Text(e['Materia2'])),
                ]),
                DataRow(cells: [
                  DataCell(Text(e['Horario3'])),
                  DataCell(Text(e['Materia3'])),
                ]),
                DataRow(cells: [
                  DataCell(Text(e['Horario4'])),
                  DataCell(Text(e['Materia4'])),
                ])
              ]),
             )



            ],
          ),
        ));


      } 
    );
  }

   _openModal() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalHorarioCreate();
        });
  }
}
