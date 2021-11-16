import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/library/category/category_controller.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'package:unipam_mobile/shared/widgets/table_page/table_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CategoryController.instance, 
      builder: (context, child) {
        return TablePage(
          title: "Categorias", 
          modalTitle: "Categoria",
          hasAdd: true,
          inputs: LibraryInputs().categoryInput, 
          onChangedText: (text, title) => CategoryController.instance.onChangedText(text, title), 
          register: (context) => CategoryController.instance.registerCategory(context), 
          errors: [],
          cleanInputs: () => CategoryController.instance.cleanInputs(), 
          animation: CategoryController.instance, 
          child: ScrollableWidget(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome")),
                DataColumn(label: Text("Data de criação")),
                DataColumn(label: Text("")),
                DataColumn(label: Text("")),
              ], rows: [
                ...CategoryController.instance.categories.map((e) => 
                    DataRow(
                      cells: [
                        DataCell(Text(e['category'])),
                        DataCell(Text(DateFormat("dd/MM/yyyy").format(e['date']))),
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
                      ]
                    )
                )
              ],
            ),
          ), 
        );
      }
    );
  }
}