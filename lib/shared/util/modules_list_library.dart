import 'package:flutter/material.dart';

class ModulesList {
  var academicModules = [
    {
      "title": "Leitores",
      "icon": Icons.accessible_forward_sharp,
      "route": "/readers"
    },
    {
      "title": "Emprestimos",
      "icon": Icons.accessible_forward_sharp,
      "route": "/loan"
    },
    {"title": "Categoria", "icon": Icons.book_outlined, "route": "/categoria"},
    {"title": "Idiomas", "icon": Icons.flag_outlined, "route": "/idiomas"},
    {"title": "Editoras", "icon": Icons.people, "route": "/editoras"},
  ];
}
