import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/model/studentsModel.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class StudentsController extends ChangeNotifier{
  static StudentsController instance = StudentsController();
  List<Map<dynamic,dynamic>> state = [];
  List<Map<dynamic, dynamic>> city = [];
  List students = [
    {"name": "Gabriel", "date": DateTime.now()},
    {"name": "Jose", "date": DateTime.now()}
  ];

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
    if (title == "Data de nascimento") grupoUsuario = text;
    if (title == "Estado civil") grupoUsuario = text;
    if (title == "Sexo") grupoUsuario = text;
    if (title == "Nome Da Mãe") grupoUsuario = text;
    if (title == "Nome Do Pai") grupoUsuario = text;
    if (title == "CEP")  changeCep(text);
    if (title == "Logradouro") grupoUsuario = text;
    if (title == "Número") grupoUsuario = text;
    if (title == "Bairro") grupoUsuario = text;
    if (title == "Complemento") grupoUsuario = text;
    if (title == "Estado") changeState(text);
    if (title == "Cidade") cidade = text;
    if (title == "Nacionalidade") nacionalidade = text;
    if (title == "Naturalidade") naturalidade = text;
    if (title == "Email") email = text;
    if (title == "Telefone fixo") grupoUsuario = text;
    if (title == "Telefone celular") grupoUsuario = text;
    if (title == "Curso") grupoUsuario = text;
    if (title == "Data de matrícula") grupoUsuario = text;
    if (title == "Data de desligamento") grupoUsuario = text;
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
      
      if(json['erro'] == true){
        logradouro = "";
        bairro = "";
        complemento = "";
      } else {
        logradouro = json['logradouro'];
        bairro = json['bairro'];
        complemento = json['complemento'];
      }
      
      
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

  handleRegisterStudents(context) {
    var studentsRegister = {
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


    if(name == "") {
      // ignore: deprecated_member_use
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
                "Não foram preenchido todos os campos", 
                style: AppText.alertContent,
              ),
            ],
          ),
        ),
        duration: Duration(seconds: 3),
      ));
    } else {
      var teste = {
      "name": name,
      "date": DateTime.now(),
      };
      
      students.add(teste);
       Scaffold.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.vertical,
        backgroundColor: AppController.instance.colorSelected,
        content: Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/success.json", width: 50, height: 50), 
              SizedBox(height: 20),
              Text(
                "Usuario Cadastrado", 
                style: AppText.alertContent,
              ),
            ],
          ),
        ),
        duration: Duration(seconds: 2),
      ));
        Future.delayed(Duration(seconds: 2), () {
          StudentsController.instance.complemento = "";
                StudentsController.instance.logradouro = "";
                StudentsController.instance.bairro = "";
                StudentsController.instance.cep = "";
                StudentsController.instance.estado = '';
                StudentsController.instance.name = "";
         Navigator.popAndPushNamed(context, "/students");
      });
    }
  }

  void removeItem(value) {
    students.removeWhere((element) => value == element['name']);
    notifyListeners();
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

