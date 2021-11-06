import 'package:flutter/material.dart';

class ModulesListLibrary {
  var academicModules = [
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
    {"title": "Categoria", "icon": Icons.book_outlined, "route": "/categoria"},
    {"title": "Idiomas", "icon": Icons.flag_outlined, "route": "/idiomas"},
    {"title": "Editoras", "icon": Icons.people, "route": "/editoras"},
  ];
}
