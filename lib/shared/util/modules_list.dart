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
      "icon": Icons.checklist_rtl_sharp,
      "route": "/frequency"
    },
    {"title": "Notas", "icon": Icons.leaderboard_sharp, "route": "/notes"},
    {"title": "Turmas", "icon": Icons.groups_sharp, "route": "/classes"},
    {
      "title": "Horarios",
      "icon": Icons.pending_actions_sharp,
      "route": "/schedule"
    },
    {"title": "Módulos", "icon": Icons.mobile_friendly, "route": "/modules"},
    {"title": "Relatórios", "icon": Icons.post_add_sharp, "route": "/reports"},
    {
      "title": "Cursos",
      "icon": Icons.quick_contacts_mail_sharp,
      "route": "/courses"
    },
  ];
}

class ModulesListLibrary {
  List libraryModules = [
    {"title": "Leitores", "icon": Icons.groups_sharp, "route": "/readers"},
    {"title": "Autores", "icon": Icons.group_work_sharp, "route": "/authors"},
    {
      "title": "Emprestimos",
      "icon": Icons.receipt_long_sharp,
      "route": "/loan"
    },
    {"title": "Livros", "icon": Icons.book_sharp, "route": "/books"},
    {
      "title": "Reservas",
      "icon": Icons.restore_page_sharp,
      "route": "/reservations"
    },
    {"title": "Categoria", "icon": Icons.category_sharp, "route": "/category"},
    {"title": "Idiomas", "icon": Icons.flag_sharp, "route": "/language"},
    {"title": "Editoras", "icon": Icons.edit_sharp, "route": "/publishers"},
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
    {
      "title": "Categorias",
      "icon": Icons.category_sharp,
      "route": "/categoryevents"
    },
    {
      "title": "Gerenciar Eventos",
      "icon": Icons.manage_search_sharp,
      "route": "/gerenciarevents"
    },
  ];
}
