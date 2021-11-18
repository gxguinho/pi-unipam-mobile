import 'package:flutter/cupertino.dart';

class GerenciarEventsController extends ChangeNotifier {
  static GerenciarEventsController instance = new GerenciarEventsController();

  List manage = [];

  String nome = "";
  String descricao = "";
  String endereco = "";
  String tipo = "";
  String categoria = "";
  String vagas = "";
  String datainicio = "";
  String datatermino = "";
  String datainscricao = "";
  String horarioevento = "";

  onChangedText(text, title) {
    if (title == "Nome do Evento") nome = text;
    if (title == "Descrição do Evento") descricao = text;
    if (title == "Endereço do Evento") endereco = text;
    if (title == "Tipo Do Evento") tipo = text;
    if (title == "Categoria") categoria = text;
    if (title == "Numero De Vagas") vagas = text;
    if (title == "Data De Inicio") datainicio = text;
    if (title == "Data De Término") datatermino = text;
    if (title == "Data De Inscrição") datainscricao = text;
    if (title == "Horário Do Evento") horarioevento = text;
  }

  cleanInputs() {
    nome = "";
    descricao = "";
    endereco = "";
    tipo = "";
    categoria = "";
    vagas = "";
    datainicio = "";
    datatermino = "";
    datainscricao = "";
    horarioevento = "";
  }

  registerManege(context) {
    var manageRegister = {
      "nome": nome,
      "descricao": descricao,
      "endereco": endereco,
      "tipo": tipo,
      "categoria": categoria,
      "vagas": vagas,
      "data de inicio": datainicio,
      "data de termino": datatermino,
      "data de inscricao": datainscricao,
      "horario do evento": horarioevento,
    };

    manage.add(manageRegister);
    Navigator.pop(context);
    notifyListeners();
  }
}
