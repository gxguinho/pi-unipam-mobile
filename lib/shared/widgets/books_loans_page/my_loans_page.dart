import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';

import 'card_book_loan.dart';

class MyLoansPage extends StatelessWidget {
  const MyLoansPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ...LoanController.instance.myloans.map((e) => CardBookLoan(
                  name: e['name'],
                  author: e['author'],
                  category: e['category'],
                  company: e['company'],
                  synopsis: e['synopsis'],
                  isMyLoan: true,
                ))
          ],
        ),
      ),
    );
  }
}

