import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(title: Text('Horário')),
        body: Center(
          child: ListView(
            children: [
              DataTable(columns: [
                DataColumn(label: Text('Segunda'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('18:50 - 19:40   Horário 1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('19:40 - 20:30   Horário 2')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20:40 - 21:30   Horário 3')),
                ]),
                DataRow(cells: [
                  DataCell(Text('21:30 - 22:20   Horário 4')),
                ])
              ]),
              DataTable(columns: [
                DataColumn(label: Text('Terça'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('18:50 - 19:40   Horário 1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('19:40 - 20:30   Horário 2')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20:40 - 21:30   Horário 3')),
                ]),
                DataRow(cells: [
                  DataCell(Text('21:30 - 22:20   Horário 4')),
                ]),
              ]),
              DataTable(columns: [
                DataColumn(label: Text('Quarta'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('18:50 - 19:40   Horário 1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('19:40 - 20:30   Horário 2')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20:40 - 21:30   Horário 3')),
                ]),
                DataRow(cells: [
                  DataCell(Text('21:30 - 22:20   Horário 4')),
                ]),
              ]),
              DataTable(columns: [
                DataColumn(label: Text('Quinta'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('18:50 - 19:40   Horário 1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('19:40 - 20:30   Horário 2')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20:40 - 21:30   Horário 3')),
                ]),
                DataRow(cells: [
                  DataCell(Text('21:30 - 22:20   Horário 4')),
                ]),
              ]),
              DataTable(columns: [
                DataColumn(label: Text('Sexta'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('18:50 - 19:40   Horário 1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('19:40 - 20:30   Horário 2')),
                ]),
                DataRow(cells: [
                  DataCell(Text('20:40 - 21:30   Horário 3')),
                ]),
                DataRow(cells: [
                  DataCell(Text('21:30 - 22:20   Horário 4')),
                ]),
              ])
            ],
          ),
        ));
  }
}
