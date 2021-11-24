import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

import 'bills_to_receive_controller.dart';

class BillsToReceivePage extends StatefulWidget {
  const BillsToReceivePage({Key? key}) : super(key: key);

  @override
  _BillsToReceivePageState createState() => _BillsToReceivePageState();
}

class _BillsToReceivePageState extends State<BillsToReceivePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: BillsToReceiveController.instance,
        builder: (context, child) {
          return TablePage(
              title: "Contas a Receber",
              modalTitle: "Cobrança",
              hasAdd: true,
              inputs: ReceiveInputs().billsToReceive,
              onChangedText: (text, title) =>
                  BillsToReceiveController.instance.onChangedText(text, title),
              register: (context) =>
                  BillsToReceiveController.instance.registerReceive(context),
              errors: [],
              cleanInputs: () => BillsToReceiveController.instance.cleanInput(),
              animation: BillsToReceiveController.instance,
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
                    ...BillsToReceiveController.instance.billsToReceive
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e['cliente'])),
                              DataCell(Text(e["nome_cliente"])),
                              DataCell(Text(e['vencimento'])),
                              DataCell(Text(e['valor_a_receber'])),
                              DataCell(Text(e['valor_parcela'])),
                              DataCell(Text(e['valor_pago'])),
                              DataCell(IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit))),
                              DataCell(IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.remove_circle))),
                            ]))
                  ],
                ),
              ));
        });
  }
}
