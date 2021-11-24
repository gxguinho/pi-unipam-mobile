import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/Events/CategoryEvents/CategoryEventsController.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class CategoryEventsPage extends StatefulWidget {
  const CategoryEventsPage({Key? key}) : super(key: key);

  @override
  _CategoryEventsPageState createState() => _CategoryEventsPageState();
}

class _CategoryEventsPageState extends State<CategoryEventsPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: CategoryEventsController.instance,
        builder: (context, child) {
          return TablePage(
              title: "Categorias Eventos",
              hasAdd: true,
              modalTitle: "Categorias Eventos",
              inputs: EventsInputs().eventsCategory,
              onChangedText: (text, title) =>
                  CategoryEventsController.instance.onChangedText(text, title),
              register: (context) =>
                  CategoryEventsController.instance.registerCategory(context),
              errors: [],
              cleanInputs: () =>
                  CategoryEventsController.instance.cleanInputs(),
              animation: CategoryEventsController.instance,
              child: ScrollableWidget(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Nome")),
                    DataColumn(label: Text("Data de criação")),
                  ],
                  rows: [
                    ...CategoryEventsController.instance.category
                        .map((e) => DataRow(
                              cells: [
                                DataCell(Text(e['nome'])),
                                DataCell(Text(DateFormat("dd/MM/yyyy")
                                    .format(e['date']))),
                              ],
                            )),
                  ],
                ),
              ));
        });
  }
}
