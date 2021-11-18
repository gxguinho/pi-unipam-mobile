import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/Events/GerenciaEvents/GerenciarEventsController.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class GerenciarEventsPage extends StatefulWidget {
  const GerenciarEventsPage({Key? key}) : super(key: key);

  @override
  _GerenciarEventsPageState createState() => _GerenciarEventsPageState();
}

class _GerenciarEventsPageState extends State<GerenciarEventsPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: GerenciarEventsController.instance,
        builder: (context, child) {
          return TablePage(
              title: "Gerenciar Eventos",
              hasAdd: true,
              modalTitle: "Gerenciar Eventos",
              inputs: GerenciarEventsInputs().manageEvents,
              onChangedText: (text, title) =>
                  GerenciarEventsController.instance.onChangedText(text, title),
              register: (context) =>
                  GerenciarEventsController.instance.registerManege(context),
              errors: [],
              cleanInputs: () =>
                  GerenciarEventsController.instance.cleanInputs(),
              animation: GerenciarEventsController.instance,
              child: ScrollableWidget(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Nome")),
                    DataColumn(label: Text("Descrição do Evento")),
                    DataColumn(label: Text("Endereço Do Evento")),
                    DataColumn(label: Text("Tipo Do Evento")),
                    DataColumn(label: Text("Categoria")),
                    DataColumn(label: Text("Numero De Vagas")),
                    DataColumn(label: Text("Data De Inicio")),
                    DataColumn(label: Text("Data De Termino")),
                    DataColumn(label: Text("Data De Inscrição")),
                    DataColumn(label: Text("Horário do Evento")),
                  ],
                  rows: [
                    ...GerenciarEventsController.instance.manage
                        .map((e) => DataRow(
                              cells: [
                                DataCell(Text(e['nome'])),
                                DataCell(Text(e['descricao'])),
                                DataCell(Text(e['endereco'])),
                                DataCell(Text(e['tipo'])),
                                DataCell(Text(e['categoria'])),
                                DataCell(Text(e['vagas'])),
                                DataCell(Text(e['data de inicio'])),
                                DataCell(Text(e['data de termino'])),
                                DataCell(Text(e['data de inscricao'])),
                                DataCell(Text(e['horario do evento'])),
                              ],
                            )),
                  ],
                ),
              ));
        });
  }
}
