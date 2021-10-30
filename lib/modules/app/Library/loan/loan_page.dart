import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_controller.dart';
import 'package:unipam_mobile/shared/widgets/books_loans_page/books_loans_page.dart';
import 'package:unipam_mobile/shared/widgets/books_loans_page/my_loans_page.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({ Key? key }) : super(key: key);

  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: AnimatedBuilder(
      animation: LoanController.instance,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Empréstimos"),
            bottom: TabBar(
              tabs: [
                Tab(text: "Livros"),
                Tab(text: "Meus Empréstimos")
            ])
          ),
          body: TabBarView(
            children: [
              BooksLoansPage(),
              MyLoansPage()
            ]
          ),
        );
      }
    ),
  );
}