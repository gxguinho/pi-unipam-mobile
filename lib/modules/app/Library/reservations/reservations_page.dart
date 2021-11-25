import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/library/book/book_controller.dart';
import 'package:unipam_mobile/modules/app/library/readers/readers_controller.dart';
import 'package:unipam_mobile/modules/app/library/reservations/reservations_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({ Key? key }) : super(key: key);

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  
  @override
  void initState() {
    super.initState();
    ReadersController.instance.getReaders();
    ReservationsController.instance.getReservations();
    BookController.instance.getBooks();
  }

  @override

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReservationsController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Reservas", 
          modalTitle: "Reserva",
          hasAdd: true,
          inputs: LibraryInputs().reservationInputs, 
          onChangedText: (text, title) => ReservationsController.instance.onChangedText(text, title), 
          register: (context) => ReservationsController.instance.registerReservation(context), 
          errors: [], 
          cleanInputs: () => ReservationsController.instance.cleanInputs(), 
          animation: ReservationsController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Pessoa")),
                DataColumn(label: Text("Código")),
                DataColumn(label: Text("Livro")),
                DataColumn(label: Text("Status"), numeric: true),
              ], rows: [
                ...ReservationsController.instance.reservations.map((e) => 
                   DataRow(
                    cells: [
                      DataCell(Text(e['reader'])),
                      DataCell(Text(e['code'].toString())),
                      DataCell(Text(e['book'])),
                      DataCell(
                        Icon(Icons.circle, 
                        color: DateTime.now().isAfter(DateTime.parse(e['return_deadline'])) != 
                        false ? Colors.red : Colors.green 
                        )
                      )
                  ]
                ))
              ],
            )
          ), 
        );
      }
    );
  }
}