import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:unipam_mobile/shared/model/studentsModel.dart';

class StudentsController extends ChangeNotifier{
  static StudentsController instance = StudentsController();

  List<Map<dynamic,dynamic>> state = [];
  List<Map<dynamic, dynamic>> city = [];

  String name = "";
  String cpf = "";
  String rg = "";
  String orgaoExpedidor = "";
  String dataNacimento = "";
  String estadoCivil = "";
  String sexo = "";
  String nomeMae = "";
  String nomePai = "";
  String cep = "";
  String logradouro = "";
  String numero = "";
  String bairro = "";
  String complemento = "";
  String estado = "";
  String cidade = "";
  String nacionalidade = "";
  String naturalidade = "";
  String email = "";
  String telefoneFixo = "";
  String telefoneCelular = "";
  String curso = "";
  String dataMatricula = "";
  String dataDesligamento = "";
  String trabalhando = "";
  String localTrabalho = "";
  String quantiedadeMoradores = "";
  String rendaFamiliar = "";
  String mediaEscolar = "";
  String nocaoInformatica = "";
  String opcaoFaculdade = "";
  String grupoUsuario = "";

  changeInputText(text,  title) {
    if (title == "Nome") name = text;
    if (title == "CPF") cpf = text;
    if (title == "RG") rg = text;
    if (title == "Orgão expedidor") orgaoExpedidor = text;
    if (title == "Data de nascimento") name = text;
    if (title == "Estado civil") name = text;
    if (title == "Sexo") name = text;
    if (title == "Nome Da Mãe") name = text;
    if (title == "Nome Do Pai") name = text;
    if(title == "CEP")  changeCep(text);
    if (title == "Logradouro") name = text;
    if (title == "Número") name = text;
    if (title == "Bairro") name = text;
    if (title == "Complemento") name = text;
    if (title == "Estado") changeState(text);
    if (title == "Cidade") name = text;
    if (title == "Nacionalidade") name = text;
    if (title == "Naturalidade") name = text;
    if (title == "Email") name = text;
    if (title == "Telefone fixo") name = text;
    if (title == "Telefone celular") name = text;
    if (title == "Curso") name = text;
    if (title == "Data de matrícula") name = text;
    if (title == "Data de desligamento") name = text;
    if (title == "Está Trabalhando") trabalhando = text;
    if (title == "Quantidade de Moradores") quantiedadeMoradores = text;
    if (title == "Renda Familiar") rendaFamiliar = text;
    if (title == "Média Escolar") mediaEscolar = text;
    if (title == "Noções de informática") nocaoInformatica = text;
    if (title == "Opção de Faculdade") opcaoFaculdade = text;
    if (title == "Grupo de usuário") grupoUsuario = text;
  }

  changeCep(text) async {
    cep = text;
    if(cep.length == 9) {
      var url = Uri.parse('https://viacep.com.br/ws/$text/json/');
      var response = await http.get(url);
      Map<String,dynamic> json = jsonDecode(response.body);
      
      logradouro = json['logradouro'];
      bairro = json['bairro'];
      complemento = json['complemento'];
      notifyListeners();
    }
  }

  changeState(text) async {
    estado = text;
    await getCity(text);
    notifyListeners();
  }

  Future<void> getCity(text) async {
    var url = Uri.parse('https://www.fieam.com.br/senaiapi/api/Cidades?uf=$text');
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> cityParsed = [];

    json.forEach((element) {
      cityParsed.add({'title': element['nome'], 'value': element['nome']});
    });
    
    city = cityParsed.toList();
  }

  handleRegisterStudents() {
    var students = {
      name,
      cpf,
      rg, 
      orgaoExpedidor, 
      dataNacimento,
      estadoCivil,
      sexo,
      nomeMae,
      nomePai,
      cep,
      logradouro,
      numero,
      bairro,
      complemento,
      estado,
      cidade,
      nacionalidade,
      naturalidade,
      email,
      telefoneFixo,
      telefoneCelular,
      curso,
      dataMatricula,
      dataDesligamento,
      trabalhando,
      localTrabalho,
      quantiedadeMoradores,
      rendaFamiliar,
      mediaEscolar,
      nocaoInformatica,
      opcaoFaculdade,
      grupoUsuario,
    };

    print(students);
  }

    Future<void> getState() async {
    var url = Uri.parse('https://www.fieam.com.br/senaiapi/api/Estados');
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> stateParsed = [];

    json.forEach((element) {
      stateParsed.add({'title': element['nome'], 'value': element['uf']});
    });
    
    state = stateParsed.toList();
  }
}

