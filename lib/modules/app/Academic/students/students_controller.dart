import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';

class  StudentsController extends ChangeNotifier {
  static StudentsController instance = new StudentsController();

  List students = [];
  List<Map<dynamic, dynamic>> state = [];
  List<Map<dynamic, dynamic>> city = [];

  String nome = '';
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

  String? token = AppController.instance.token;
  
  var url = Uri.parse("https://unipamapi.devjhon.com/students");

  Future<void> deleteStudent(id) async {
    var urlDelete = Uri.parse('https://unipamapi.devjhon.com/students/$id');

    var response = await http.delete(urlDelete,
      headers: {
        'Authorization': token!
      }
    );
    
    notifyListeners();
    await getStudent();
  }

  Future<void> getStudent() async {
    var response = await http.get(url, 
      headers: {
        'Authorization': token!
      }
    );
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> studentsParsed = [];

    json.forEach((element) { 
     studentsParsed.add({
       'name': element['name'], 
       'date': element['created_at'], 
       'id': element['id']});
    });

    students = studentsParsed.toList();
    notifyListeners();
  }

  onChangedText(text, title) {
     if (title == "Nome") nome = text;
    if (title == "CPF") cpf = text;
    if (title == "RG") rg = text;
    if (title == "Orgão expedidor") orgaoExpedidor = text;
    if (title == "Data de nascimento") dataNacimento = text;
    if (title == "Estado civil") estadoCivil = text;
    if (title == "Sexo") sexo = text;
    if (title == "Nome Da Mãe") nomeMae = text;
    if (title == "Nome Do Pai") nomePai = text;
    if (title == "CEP") changeCep(text);
    if (title == "Logradouro") logradouro = text;
    if (title == "Número") numero = text;
    if (title == "Bairro") bairro = text;
    if (title == "Complemento") complemento = text;
    if (title == "Estado") changeState(text);
    if (title == "Cidade") cidade = text;
    if (title == "Nacionalidade") nacionalidade = text;
    if (title == "Naturalidade") naturalidade = text;
    if (title == "Email") email = text;
    if (title == "Telefone fixo") telefoneFixo = text;
    if (title == "Telefone celular") telefoneCelular = text;
    if (title == "Curso") curso = text;
    if (title == "Data de matrícula") dataMatricula = text;
    if (title == "Data de desligamento") dataDesligamento = text;
    if (title == "Está Trabalhando") trabalhando = text;
    if (title == "Quantidade de Moradores") quantiedadeMoradores = text;
    if (title == "Renda Familiar") rendaFamiliar = text;
    if (title == "Média Escolar") mediaEscolar = text;
    if (title == "Noções de informática") nocaoInformatica = text;
    if (title == "Opção de Faculdade") opcaoFaculdade = text;
    if (title == "Grupo de usuário") grupoUsuario = text;
  }

  cleanInputs() {
    nome = '';
    cpf = "";
    rg = "";
    orgaoExpedidor = "";
    dataNacimento = "";
    estadoCivil = "";
    sexo = "";
    nomeMae = "";
    nomePai = "";
    cep = "";
    logradouro = "";
    numero = "";
    bairro = "";
    complemento = "";
    estado = "";
    cidade = "";
    nacionalidade = "";
    naturalidade = "";
    email = "";
    telefoneFixo = "";
    telefoneCelular = "";
    curso = "";
    dataMatricula = "";
    dataDesligamento = "";
    trabalhando = "";
    localTrabalho = "";
    quantiedadeMoradores = "";
    rendaFamiliar = "";
    mediaEscolar = "";
    nocaoInformatica = "";
    opcaoFaculdade = "";
    grupoUsuario = "";
  }

  registerStudent(context) {
    var studentsRegister = {
      "name": nome,
      "cpf": cpf,
      "rg": rg,
      "dispatching_agency": orgaoExpedidor,
      "birth_date": dataNacimento,
      "civil_status": estadoCivil,
      "sex": sexo,
      "father_name": nomePai,
      "mother_name": nomeMae,
      "cep": cep,
      "street": logradouro,
      "home_number": numero,
      "district": bairro,
      "complement": complemento,
      "state": estado,
      "city": cidade,
      "nactionality": nacionalidade,
      "naturalness": naturalidade,
      "email": email,
      "land_line": telefoneFixo,
      "phone_number": telefoneCelular,
      "registration_date": dataMatricula,
      "termination_date": dataDesligamento,
      "is_working": trabalhando,
      "workplace": localTrabalho,
      "family_income": rendaFamiliar,
      "residents_number": quantiedadeMoradores,
      "school_year": mediaEscolar,
      "computer_notions": nocaoInformatica,
      "college_option": opcaoFaculdade,
      "group_id": grupoUsuario
    };
  }

  Future<void> getCity(text) async {
    var url =
        Uri.parse('https://www.fieam.com.br/senaiapi/api/Cidades?uf=$text');
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> cityParsed = [];

    json.forEach((element) {
      cityParsed.add({'title': element['nome'], 'value': element['nome']});
    });

    city = cityParsed.toList();
    notifyListeners();
  }

  changeState(text) async {
    estado = text;
    await getCity(text);
    notifyListeners();
  }

  changeCep(text) async {
    cep = text;
    if (cep.length == 9) {
      var url = Uri.parse('https://viacep.com.br/ws/$text/json/');
      var response = await http.get(url);
      Map<String, dynamic> json = jsonDecode(response.body);

      if (json['erro'] == true) {
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

  Future<void> getState() async {
    var url = Uri.parse('https://www.fieam.com.br/senaiapi/api/Estados');
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    List<Map<dynamic, dynamic>> stateParsed = [];

    json.forEach((element) {
      stateParsed.add({'title': element['nome'], 'value': element['uf']});
    });

    state = stateParsed.toList();
    notifyListeners();
  }
}