import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class CardCurse extends StatelessWidget {
  const CardCurse({Key? key, required this.professor, required this.nomeCurso, required this.quantAlunos, required this.onTap}) : super(key: key);

  final String professor;
  final String nomeCurso;
  final String quantAlunos;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nomeCurso,  style: AppText.cardPrincipal),
              SizedBox(height: 6),
              Row(
                children: [
                  Text("Quantidade De Alunos: ",  style: AppText.cardPrincipal),
                  Text(quantAlunos, style: AppText.cardSecund)
                ],
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Text("Professor Responsavel: ",  style: AppText.cardPrincipal),
                  Text(professor.toUpperCase(),  style: AppText.cardSecund)
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
