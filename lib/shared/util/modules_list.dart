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
    {"title": "Notas", "icon": Icons.analytics_outlined, "route": "/notes"},
    {"title": "Turmas", "icon": Icons.analytics_outlined, "route": "/turmas"},
    {
      "title": "Notas", 
      "icon": Icons.analytics_outlined, 
      "route": "/notes"
    },
    {
      "title": "Turmas", 
      "icon": Icons.analytics_outlined, 
      "route": "/classes"
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
      "title": "Horarios",
      "icon": Icons.analytics_outlined,
      "route": "/schedule"
    },
    {
      "title": "Módulos",
      "icon": Icons.mobile_friendly,
      "route": "/modules"
    },
    {"title": "Relatórios", "icon": Icons.article, "route": "/reports"},
    {"title": "Cursos", "icon": Icons.analytics_outlined, "route": "/courses"},
  ];
}

class ModulesListLibrary {
  List libraryModules = [
    {"title": "Leitores", "icon": Icons.people, "route": "/readers"},
    {
      "title": "Autores",
      "icon": Icons.collections_bookmark,
      "route": "/authors"
    },
    {
      "title": "Emprestimos",
      "icon": Icons.accessible_forward_sharp,
      "route": "/loan"
    },
    {
      "title": "Livros",
      "icon": Icons.accessible_forward_sharp,
      "route": "/books"
    },
    {
      "title": "Reservas",
      "icon": Icons.accessible_forward_sharp,
      "route": "/reservations"
    },
    {"title": "Categoria", "icon": Icons.book_outlined, "route": "/category"},
    {"title": "Idiomas", "icon": Icons.flag_outlined, "route": "/language"},
    {"title": "Editoras", "icon": Icons.people, "route": "/publishers"},
  ];
}

class ModulesListFinancial {
  List financialModules = [
    {
      "title": "Contas a Pagar",
      "icon": Icons.attach_money,
      "route": "/billsToPay"
    },
    {
      "title": "Contas a Receber",
      "icon": Icons.attach_money,
      "route": "/billsToReceive"
    },
  ];
}

class ModulesListEvents {
  var eventsModules = [
    {"title": "Categorias", "icon": Icons.people, "route": "/categoryevents"},
    {
      "title": "Gerenciar Eventos",
      "icon": Icons.people,
      "route": "/gerenciarevents"
    },
  ];
}
