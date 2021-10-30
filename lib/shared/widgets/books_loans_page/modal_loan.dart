import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class ModalLoan extends StatelessWidget {
  const ModalLoan({ 
    Key? key, 
    required this.name, 
    required this.category, 
    required this.company, 
    required this.author, 
    required this.synopsis, this.isMyLoan
  }) : super(key: key);

  final String name;
  final String category;  
  final String company;
  final String author;
  final String synopsis;
  final bool? isMyLoan;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
        child: Scaffold(
          appBar: AppBar(),
          body: Builder(
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(name, style: AppText.titleBook),
                    SizedBox(height: 10),
                    Text(synopsis, style: AppText.subBook),
                    SizedBox(height: 8),
                    Text(category, style: AppText.subBook),
                    SizedBox(height: 3),
                    Text(company, style: AppText.subBook),
                    SizedBox(height: 3),
                    Text(author, style: AppText.subBook),
                    SizedBox(height: 10),
                    isMyLoan != true ? 
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.purple,
                        textStyle: AppText.buttonTitle,
                        minimumSize: Size(60, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => LoanController.instance.handleRegisterLoan(name, category, company, author, synopsis,context),
                      child: Text("Fazer Emprestimo"),
                    ) : Container(),
                  ],
                ),
              );
            }
          ),
        ),
    );
  }
}