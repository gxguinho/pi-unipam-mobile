import 'package:flutter/material.dart';

class ModulesListAcademic {
  var academicModules = [
    {
      "title": "Alunos",
      "icon": Icons.people_alt_outlined,
      "route": "/students"
    },
    {
      "title": "Frequência",
      "icon": Icons.analytics_outlined,
      "route": "/frequency"
    },
    {
      "title": "Notas", 
      "icon": Icons.analytics_outlined, 
      "route": "/notes"
    },
    {
      "title": "Turmas", 
      "icon": Icons.analytics_outlined, 
      "route": "/turmas"
    },
    {
      "title": "Horarios", 
      "icon": Icons.analytics_outlined, 
      "route": "/schedule"
    },
    {
      "title": "Relatórios",
      "icon": Icons.article,
      "route": "/reports"
    },
     {
      "title": "Cursos",
      "icon": Icons.analytics_outlined,
      "route": "/courses"
    },
  ];
}

class ModulesListLibrary {
  List libraryModules = [
    {
      "title": "Leitores", 
      "icon": Icons.people, 
      "route": "/readers"
    },
    {
      "title": "Autores",
      "icon": Icons.bookmark,
      "route": "/authors"
    },
    {
      "title": "Emprestimos",
      "icon": Icons.collections_bookmark_sharp,
      "route": "/loan"
    },
    {
      "title": "Livros",
      "icon": Icons.book,
      "route": "/books"
    },
    {
      "title": "Reservas",
      "icon": Icons.inbox,
      "route": "/reservations"
    },
    {
      "title": "Categoria", 
      "icon": Icons.book_outlined, 
      "route": "/category"
    },
    {
      "title": "Idiomas", 
      "icon": Icons.flag_outlined, 
      "route": "/language"
    },
    {
      "title": "Editoras", 
      "icon": Icons.people, 
      "route": "/publishers"
    },
  ];
}
class ModulesListFinancial {
  List financialModules = [
    {
      "title": "Contas a Pagar", 
      "icon": Icons.attach_money, 
      "route": "/billsToPay"
    },
  ];
}



