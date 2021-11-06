import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/reservations/reservations_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/dropdown_create.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_reservation_create.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({ Key? key }) : super(key: key);

  @override
  _ReservationsPageState createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReservationsController.instance,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
             title: Text("Reservas", style: AppText.barTitle),
             actions: [
          IconButton(
            onPressed: () => _openModal(),
            icon: Icon(
              Icons.add_circle,
              size: 32,
            )),
        ],
          ),
          body: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Pessoa")),
                DataColumn(label: Text("Código")),
                DataColumn(label: Text("Livro")),
                DataColumn(label: Text("Status")),
              ], rows: [
                ...ReservationsController.instance.reservation.map((e) => 
                   DataRow(cells: [
                     DataCell(Text(e['pessoa']),),
                     DataCell(Text(e['cod']),),
                     DataCell(Text(e['title']),),
                     DataCell(
                      Icon(Icons.circle, color: e['status'] != false ? Colors.red : Colors.green)
                     ),
                   ])
                )
              ],
            ),
          ),
        );
      }
    );
  }
   _openModal() {
    showDialog(
      context: context,
      builder: (context) {
        return ModalReservationCreate();
    });
  }
}