import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/library/book/book_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class BookPage extends StatelessWidget {
  const BookPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: BookController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Livros", 
          modalTitle: "Livro",
          hasAdd: true, 
          inputs: LibraryInputs().booksInput, 
          onChangedText: (text, title) => BookController.instance.onChangedText(text, title), 
          register: (context) => BookController.instance.registerBook(context), 
          errors: [], 
          cleanInputs: () => BookController.instance.cleanInputs(), 
          animation: BookController.instance,
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Código")),
                DataColumn(label: Text("Livro")),
                DataColumn(label: Text("Autor")),
                DataColumn(label: Text("Ano")),
                DataColumn(label: Text("Localização")),
                DataColumn(label: Text("Disponibilidade")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ],
              rows: [
                ...BookController.instance.books.map((e) => 
                  DataRow(
                  cells: [
                    DataCell(Text(e['codigo'])),
                    DataCell(Text(e["titulo"])),
                    DataCell(Text(e["autores"])),
                    DataCell(Text(e["ano"])),
                    DataCell(Text(e["localizacao"])),
                    DataCell(Text(e["quantidadeExeplaresDisponiveis"])),
                    DataCell(
                      IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.edit)
                      )
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.remove_circle)
                      )
                    ),
                  ], 
                  )
                )
              ],
            )
          ), 
        );
      }
    );
  }
}