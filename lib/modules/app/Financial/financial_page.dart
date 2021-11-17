import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/shared/util/modules_list.dart';
import 'package:unipam_mobile/shared/widgets/module_page/module_page.dart';

class FinancialPage extends StatefulWidget {
  const FinancialPage({Key? key}) : super(key: key);

  @override
  _FinancialPageState createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> {
  @override
  Widget build(BuildContext context) {
    return ModulePage(
        title: "Financeiro", pages: ModulesListFinancial().financialModules);
  }
}
