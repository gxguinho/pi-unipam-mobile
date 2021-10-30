import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/icon_navegation/icon_navegation_button.dart';

class TurmaPage extends StatefulWidget {
  const TurmaPage({Key? key}) : super(key: key);

  @override
  _TurmaState createState() => _TurmaState();
}

class _TurmaState extends State<TurmaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento De Turma", style: AppText.barTitle),
      ),
      body: Container(
        child: Container(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconNavegationButton(
                  title: ' Turma Aberta  ',
                  icon: Icons.school_outlined,
                  route: '/turmaaberta'),
              IconNavegationButton(
                  title: 'Turma Fechada',
                  icon: Icons.school,
                  route: '/turmafechada'),
            ],
          ),
        ),
      ),
    );
  }
}
