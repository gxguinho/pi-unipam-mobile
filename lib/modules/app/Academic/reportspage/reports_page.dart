import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_reports.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_reports_create.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';
import 'reports_controller.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int? sortColumnIndex;
  bool isSearching = false;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    ReportsController.instance.onChangedText("");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ReportsController.instance,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: !isSearching
                ? Text("Relatórios", style: AppText.barTitle)
                : TextField(
                    onChanged: (text) =>
                        ReportsController.instance.onChangedText(text),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: AppColors.white,
                      ),
                      hintText: "Procure aluno",
                    ),
                  ),
            actions: [
              isSearching
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          this.isSearching = !this.isSearching;
                        });
                      },
                      icon: Icon(Icons.cancel, size: 30),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          this.isSearching = !this.isSearching;
                        });
                      },
                      icon: Icon(Icons.search, size: 30),
                    ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_list, size: 30),
              ),
            ],
          ),
          body: ScrollableWidget(
            child: DataTable(
              columnSpacing: 100,
              columns: [
                DataColumn(label: Text("Nomes")),
                DataColumn(label: Text("Relatórios")),
                DataColumn(label: Text(""))
              ],
              rows: [
                ...ReportsController.instance.studentsFillter.map(
                  (e) => DataRow(
                    cells: [
                      DataCell(Text(e['aluno'].toString())),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            _openModalReport(e["aluno"], e["report"]);
                          },
                          icon: Icon(Icons.article),
                        ),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            _openModal(e["aluno"]);
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _openModalReport(aluno, descricao) {
    showDialog(
        context: context,
        builder: (context) {
          return ModalReports(
            aluno: aluno,
            descricao: descricao,
          );
        });
  }

  _openModal(aluno) {
    showDialog(
        context: context,
        builder: (context) {
          return ModalInsertReports(
            aluno: aluno,
          );
        });
  }
}
