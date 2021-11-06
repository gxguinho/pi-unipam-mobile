import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/books/books_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_create_book.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({ Key? key }) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: BooksController.instance,
        builder: (context, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Livros", style: AppText.barTitle),
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
          DataColumn(label: Text("Código")),
          DataColumn(label: Text("Titulo")),
          DataColumn(label: Text("Autor")),
          DataColumn(label: Text("Ano")),
          DataColumn(label: Text("Localização")),
          DataColumn(label: Text("Disponibilidade")),
          DataColumn(label: Text("")),
        ],
        rows: [
           ...BooksController.instance.books.map((e) => 
            DataRow(cells: [
              DataCell(Text(e['codigo']),),
              DataCell(Text(e['titulo']),),
              DataCell(Text(e['autores']),),
              DataCell(Text(e['ano']),),
              DataCell(Text(e['localizacao']),),
              DataCell(Text(e['quantidadeExeplares']),),
              DataCell(Text(""),),
            ]),
          )
        ],
        ),
      )
    );
  });
  }

   _openModal() {
    showDialog(
      context: context,
      builder: (context) {
        return ModalCreateBook();
    });
  }
}