import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/Frequency/frequency_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({Key? key}) : super(key: key);

  @override
  _FrequencyPageState createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  int? sortColumnIndex;
  bool isSearching = false;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: FrequencyController.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: !isSearching
                  ? Text("Frequência", style: AppText.barTitle)
                  : TextField(
                      onChanged: (text) =>
                          FrequencyController.instance.onChangedText(text),
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
                columns: [
                  DataColumn(label: Text("Aulas")),
                  DataColumn(label: Text("Presenças")),
                  DataColumn(label: Text("Faltas")),
                  DataColumn(label: Text("Frequência")),
                ],
                rows: [
                  ...FrequencyController.instance.frequencyFillter
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e['aula'].toString())),
                            DataCell(Text(e['presenca'].toString())),
                            DataCell(Text(e['faltas'].toString())),
                            DataCell(Text("")),
                          ]))
                ],
              ),
            ),
          );
        });
  }
}
