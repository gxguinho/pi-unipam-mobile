import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/shared/widgets/books_loans_page/card_book_loan.dart';

class BooksLoansPage extends StatefulWidget {
  const BooksLoansPage({ Key? key }) : super(key: key);

  @override
  _BooksLoansPageState createState() => _BooksLoansPageState();
}

class _BooksLoansPageState extends State<BooksLoansPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ...LoanController.instance.books.map((e) => 
                  CardBookLoan(
                    name: e['name'],
                    author: e['author'],
                    category: e['category'],
                    company: e['company'],
                    synopsis: e['synopsis'],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}