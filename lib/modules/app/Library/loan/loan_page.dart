import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/util/input_modal_list.dart';
import 'package:unipam_mobile/shared/widgets/alert_remove_button/alert_remove_button.dart';
import 'package:unipam_mobile/shared/widgets/label_button_navegation/label_button_navegation.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/dropdown_create.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/input_text_create.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  late List<GDPData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emprestimos", style: AppText.barTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            children: [
              ...LibraryInputs().loanInput.map((e) => e['isDropdown'] == false
                  ? InputTextCreate(
                      title: e['title'] as String,
                      icon: e['icon'] as IconData,
                      maxLength: e['maxLength'] as int,
                      type: e['type'] as TextInputType,
                      textFormatter: e['textFormater'] as String,
                      error: "",
                      isError: []
                          .map((element) => element['title'] == e['element'])
                          .toList(),
                      onChangedText: (text) => LoanController.instance.onChangedText(text, e['title']),
                      animation: LoanController.instance,
                      controller: e['controller'],
                    ): DropdownCreate(
                      title: e['title'] as String,
                      itemsSelect: e['itens'] as List<Map<dynamic, dynamic>>,
                      onChanged: (text) => LoanController.instance.onChangedText(text, e['title']),
                    )),
              LabelButtonNavegation(
                text: "Buscar",
                onChanged: (context) => LoanController.instance.gerarRelatorio(),
              ),
              SizedBox(height: 10),
              SfCartesianChart(
                title: ChartTitle(text: "Reservas"),
                legend: Legend(isVisible: true),
                series: <ChartSeries>[
                  BarSeries<GDPData, String>(
                    dataSource: _chartData, 
                    xValueMapper: (GDPData gdp, _) => gdp.container, 
                    yValueMapper: (GDPData gdp, _) => gdp.gdp
                  )
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'GDP in billions of U.S. Dollars')),
                ),
              AlertRemoveButton(
                text: "Gerar Relatórios",
                onChanged: (context) => {},
              ),
            ],
          ),
        ),
      ),
    );
 }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Ocenia", 1200)
    ];
    return chartData;
  }

}

class GDPData {
  GDPData(this.container, this.gdp);
  final String container;
  final double gdp;
}
