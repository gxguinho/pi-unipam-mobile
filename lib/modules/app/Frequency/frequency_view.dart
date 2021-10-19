import 'package:flutter/material.dart';
import 'package:unipam_mobile/data/students.dart';
import 'package:unipam_mobile/models/student.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/drawer/drawer_widget.dart';
import 'package:unipam_mobile/shared/widgets/modal_create_frequency/modal_create_frequency.dart';
import 'package:unipam_mobile/shared/widgets/scrollable/scrollable_widget.dart';

class FrequencyView extends StatefulWidget {
  const FrequencyView({Key? key}) : super(key: key);

  @override
  _FrequencyViewState createState() => _FrequencyViewState();
}

class _FrequencyViewState extends State<FrequencyView> {
  late List<Student> students;
  int? sortColumnIndex;
  bool isSearching = false;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.students = List.of(allStudents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: !isSearching
            ? Text("Frequência", style: AppText.barTitle)
            : TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: AppColors.white,
                    ),
                    hintText: "Procure aluno"),
              ),
        backgroundColor: AppColors.purple,
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
          IconButton(
            onPressed: () => _openModal(),
            icon: Icon(Icons.add_circle, size: 30),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SingleChildScrollView(
              child: ScrollableWidget(child: buildDataTable())),
        ],
      ),
    );
  }

  Widget buildDataTable() {
    final columns = ['Primeiro Nome', 'Total Aulas', 'Presença'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(students),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Student> students) =>
      students.map((Student student) {
        final cells = [
          student.firstName,
          student.totalClasses,
          student.participation
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      students.sort((student1, student2) =>
          compareString(ascending, student1.firstName, student2.firstName));
    } else if (columnIndex == 1) {
      students.sort((student1, student2) => compareString(
          ascending, '${student1.totalClasses}', '${student2.totalClasses}'));
    } else if (columnIndex == 2) {
      students.sort((student1, student2) => compareString(
          ascending, '${student1.participation}', '${student2.participation}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  _openModal() {
    showDialog(
        context: context,
        builder: (context) {
          return ModalCreateFrequency();
        });
  }
}
