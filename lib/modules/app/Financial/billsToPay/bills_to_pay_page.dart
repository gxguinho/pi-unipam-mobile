import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

import 'bills_to_pay_controller.dart';

class BillsToPayPage extends StatefulWidget {
  const BillsToPayPage({Key? key}) : super(key: key);

  @override
  _BillsToPayPageState createState() => _BillsToPayPageState();
}

class _BillsToPayPageState extends State<BillsToPayPage> {
  @override
   @override
  void initState() {
    super.initState();
    BillsToPayController.instance.getbillsToPay();
  }
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: BillsToPayController.instance,
        builder: (context, child) {
          return TablePage(
              title: "Contas a Pagar",
              modalTitle: "Cobrança",
              hasAdd: true,
              inputs: FonancialInputs().billsToPayInput,
              onChangedText: (text, title) =>
                  BillsToPayController.instance.onChangedText(text, title),
              register: (context) =>
                  BillsToPayController.instance.registerbillsToPay(context),
              errors: [],
              cleanInputs: () => BillsToPayController.instance.cleanInput(),
              animation: BillsToPayController.instance,
              child: ScrollableWidget(
                child: DataTable(
                  columnSpacing: 30,
                  dataRowHeight: 60,
                  columns: [
                    DataColumn(label: Text("Título")),
                    DataColumn(label: Text("Cliente")),
                    DataColumn(label: Text("Vencimento")),
                    DataColumn(label: Text("Valor")),
                    DataColumn(label: Text("A pagar")),
                    DataColumn(label: Text("Valor pago")),
                    DataColumn(label: Text("")),
                    DataColumn(label: Text("")),
                  ],
                  rows: [
                    ...BillsToPayController.instance.billsToPay
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e['title_number'])),
                              DataCell(Text("provider")),
                              DataCell(Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(e['due_date'])))),
                              DataCell(Text(e['description'])),
                              DataCell(Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(e['issue_date'])))),
                              DataCell(Text(e['title_value'])),
                              DataCell(IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit))),
                              DataCell(IconButton(
                                  onPressed: () => BillsToPayController.instance.deletebillsToPay(e['id']) ,
                                  icon: Icon(Icons.remove_circle))),
                            ]))
                  ],
                ),
              ));
        });
  }
}
