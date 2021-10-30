import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/books_loans_page/modal_loan.dart';

class CardBookLoan extends StatelessWidget {
  const CardBookLoan({ Key? key, required this.name, required this.category, required this.company, required this.author, required this.synopsis, this.isMyLoan }) : super(key: key);
  final String name;
  final String category;  
  final String company;
  final String author;
  final String synopsis;
  final bool? isMyLoan;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2.5, color: AppController.instance.colorSelected)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.book,
                  size: 28,
                )
              ),
              Text(name, style: AppText.titleBook),
              SizedBox(height: 10),
              Text(category, style: AppText.subBook),
              SizedBox(height: 3),
              Text(company, style: AppText.subBook),
              SizedBox(height: 3),
              Text(author, style: AppText.subBook),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.purple,
                        textStyle: AppText.buttonTitle,
                        minimumSize: Size(60, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => _openModal(context, isMyLoan == true ? true : false), 
                      child: Text("Detalhes")
                    ),
                  ),
                  SizedBox(width: 10),
                  isMyLoan == true ? Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: AppColors.purple,
                      textStyle: AppText.buttonTitle,
                      minimumSize: Size(60, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                      onPressed: () => LoanController.instance.removeBook(name), 
                      child: Text("Remover Livro")
                    ),
                  ) : Container(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _openModal(context, isMyLoan) {
    showDialog(
        context: context,
        builder: (context) {
          return ModalLoan(
            name: name, 
            author: author, 
            category: category,
            company: company,
            synopsis: synopsis,
            isMyLoan: isMyLoan,
          );
        });
  }
}