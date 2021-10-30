import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

import '../../app_controller.dart';

class LoanController extends ChangeNotifier{

  static LoanController instance = LoanController();
      
  List books = [
    {"name": "Programação orientada a objetos", "category": "Tecnologia", "company": "Saraiva Educação S.A.", "author": "Sérgio Furgeri", "synopsis": "Este livro tem como finalidade possibilitar ao estudante o aprendizado dos conceitos básicos de programação orientada a objetos usando a linguagem Java. O livro apresenta os conceitos com clareza e simplicidade mostrando exemplos e sugerindo problemas práticos e ilustrativos dos conceitos e de algoritmos em geral."},
    {"name": "HARRY POTTER E A PEDRA FILOSOFAL ", "category": "Ficção", "company": "Saraiva Educação S.A.", "author": "J.K Rowling ", "synopsis": "Há 20 anos a magia aterrissou no Brasil com a chegada de Harry Potter e a Pedra Filosofal. Para comemorar este aniversário tão especial de um dos livros mais vendidos da história, a Rocco lançou esta coleção de luxo em edição limitada com os sete livros em capa dura, com ilustrações de Brian Selznick (vencedor da Medalha Caldecott) e Mary GrandPré."},
     {"name": "a arte de fazer o dobro do trabalho na metade do tempo ", "category": "Tecnologia", "company": "Saraiva Educação S.A.", "author": "J.K Rowling ", "synopsis": "Repleto de histórias empolgantes e exemplos reais. O método de gerenciamento de projetos conhecido como Scrum deve ser a ferramenta de produtividade mais largamente empregada entre as empresas de alta tecnologia"}
  ];    
  List myloans = [];

  handleRegisterLoan(name, category, company, author, synopsis,context) {
    var book = {
      "name": name,
      "category": category,
      "company": company,
      "author": author,
      "synopsis": synopsis
    };
    var isBookExisted = myloans.where((element) => element['name'] == name);
    if(isBookExisted.length > 0) {
      return alertDismiss(context);
    } else {
       myloans.add(book);
      notifyListeners();
      Navigator.pop(context);
    }

   
  }
  
  removeBook(name) {
    myloans.removeWhere((element) => element['name'] == name);
    notifyListeners();
  }

  alertDismiss(context) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.vertical,
      backgroundColor: AppController.instance.colorSelected,
      content: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/error.json", width: 50, height: 50),
            SizedBox(height: 20),
            Text(
              "Voce já fez emprestimo desse livro!!",
              style: AppText.alertContent,
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 3),
    ));
  } 
} 