import 'package:flutter/material.dart';

class ModulesListLibrary {
  var academicModules = [
    {"title": "Leitores", "icon": Icons.people, "route": "/readers"},
    {"title": "Autores", "icon": Icons.bookmark, "route": "/authors"},
    {
      "title": "Empréstimos",
      "icon": Icons.collections_bookmark_sharp,
      "route": "/loan"
    },
    {"title": "Livros", "icon": Icons.book, "route": "/books"},
    {"title": "Reservas", "icon": Icons.inbox, "route": "/reservations"},
    {"title": "Categoria", "icon": Icons.book_outlined, "route": "/categoria"},
    {"title": "Idiomas", "icon": Icons.flag_outlined, "route": "/idiomas"},
    {"title": "Editoras", "icon": Icons.people, "route": "/editoras"},
  ];
}
