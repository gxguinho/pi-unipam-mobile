import 'package:flutter/cupertino.dart';

class BookController extends ChangeNotifier {
  static BookController instance = new BookController();

  List books = [];

  String codigo = "";
  String titulo = "";
  String autores = "";
  String edicao = "";
  String volume = "";
  String ano = "";
  String editora = "";
  String idioma = "";
  String categoria = "";
  String quantidadeExeplares = "";
  String quantidadeExeplaresDisponiveis = "";
  String localizacao = "";

   onChangedText(text, title) {
    if (title == "Código") codigo = text;
    if (title == "Título") titulo = text;
    if (title == "Autores") autores = text;
    if (title == "Edição") edicao = text;
    if (title == "Volume") volume = text;
    if (title == "Ano") ano = text;
    if (title == "Editora") editora = text;
    if (title == "Idioma") idioma = text;
    if (title == "Categoria") categoria = text;
    if (title == "Quantidade de exemplares") quantidadeExeplares = text;
    if (title == "Quantidade de exemplares disponíveis") quantidadeExeplaresDisponiveis = text;
    if (title == "Localização") localizacao = text;
  }

   cleanInputs() {
    codigo = "";
    titulo = "";
    autores = "";
    edicao = "";
    volume = "";
    ano = "";
    editora = "";
    idioma = "";
    categoria = "";
    quantidadeExeplares = "";
    quantidadeExeplaresDisponiveis = "";
    localizacao = "";
  }

  registerBook(context) {
    var bookRegister = {
      "codigo": codigo,
      "titulo": titulo,
      "autores": autores,
      "edicao": edicao,
      "volume": volume,
      "ano": ano,
      "editora": editora,
      "idioma": idioma,
      "categoria": categoria,
      "quantidadeExeplares": quantidadeExeplares,
      "quantidadeExeplaresDisponiveis": quantidadeExeplaresDisponiveis,
      "localizacao": localizacao,
    };

    books.add(bookRegister);
    Navigator.pop(context);
    notifyListeners();
  }

} 