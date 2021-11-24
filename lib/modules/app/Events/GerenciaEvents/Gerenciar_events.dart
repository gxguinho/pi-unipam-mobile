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
  void initState() {
    super.initState();
    GerenciarEventsController.instance.getManageEvents();
  }

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
                    DataColumn(label: Text("Data de criação")),
                    DataColumn(label: Text("")),
                  ],
                  rows: [
                    ...GerenciarEventsController.instance.manage
                        .map((e) => DataRow(
                              cells: [
                                DataCell(Text(e['name'])),
                                DataCell(Text(DateFormat("dd/MM/yyyy")
                                    .format(DateTime.parse(e['date'])))),
                                DataCell(IconButton(
                                    onPressed: () => GerenciarEventsController
                                        .instance
                                        .deleteEvent(e['id']),
                                    icon: Icon(Icons.remove_circle))),
                              ],
                            )),
                  ],
                ),
              ));
        });
  }
}
