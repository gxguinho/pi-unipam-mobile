import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_controller.dart';

class InputModalList {
  var studentsInputs = [
    {
      "title": "Nome",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.name,
      "textFormater": ''
    },
    {
      "title": "CPF",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '###.###.###-##'
    },
    {
      "title": "RG",
      "icon": Icons.assignment_ind,
      "error": "Campo Obrigatório",
      "maxLength": 14,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Orgão expedidor",
      "icon": Icons.corporate_fare_sharp,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.text,
      "textFormater": ''
    },
    {
      "title": "Data de nascimento",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####'
    },
    {
      "title": "Estado civil",
      "error": null,
      "itens": [
        {"title": "Solteiro", "value": "solteiro"}, 
        {"title": "Casado", "value": "casado"},
        {"title": "Separado", "value": "separado"},
        {"title": "Viúvo", "value": "viúvo"},
        {"title": "Outro", "value": "outro"}
      ]
    },
     {
      "title": "Sexo",
      "error": null,
      "itens": [
        {"title": "Masculino", "value": "masculino"}, 
        {"title": "Feminino", "value": "feminino"},
      ]
    },
    {
      "title": "Nome Do Mãe",
      "icon": Icons.family_restroom,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.name,
      "textFormater": ''
    },
     {
      "title": "Nome Da Pai",
      "icon": Icons.family_restroom,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.name,
      "textFormater": ''
    },
    {
      "title": "CEP",
      "icon": Icons.door_sliding_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": "#####-###"
    },
    {
      "title": "Logradouro",
      "icon": Icons.add_road,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Número",
      "icon": Icons.format_list_numbered,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Bairro",
      "icon": Icons.edit_road_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Complemento",
      "icon": Icons.edit_rounded,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": ''
    },
    {
      "title": "Estado",
      "icon": Icons.people,
      "itens": StudentsController.instance.state,
    },
    {
      "title": "Cidade",
      "icon": Icons.location_city,
      "itens": StudentsController.instance.city,
    },
    {
      "title": "Nacionalidade",
      "icon": Icons.flag,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": ''
    },
    {
      "title": "Naturalidade",
      "icon": Icons.outlined_flag_sharp,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": ''
    },
    {
      "title": "Email",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": ''
    },
     {
      "title": "Telefone fixo",
      "icon": Icons.phone,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) ####-####'
    },
    {
      "title": "Telefone celular",
      "icon": Icons.phone_android,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) #####-####'
    },
    {
      "title": "Curso",
      "error": null,
      "itens": [
        {"title": "", "value": ""}, 
      ]
    },
    {
      "title": "Data de matrícula",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####'
    },
    {
      "title": "Data de desligamento",
      "icon": Icons.date_range,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####'
    },
    {
      "title": "Está Trabalhando",
      "icon": Icons.people,
      "itens": [
        {"title": "Sim", "value": "sim"},
        {"title": "Não", "value": "nao"}],
    },
    {
      "title": "Local de Trabalho",
      "icon": Icons.work,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.text,
      "textFormater": ''
    },
    {
      "title": "Renda Familiar",
      "icon": Icons.attach_money_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Quantidade de Moradores",
      "icon": Icons.format_list_numbered_sharp,
      "error": "Campo Obrigatório",
      "maxLength": 3,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Ano Letivo",
      "icon": Icons.yard_rounded,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Média Escolar",
      "icon": Icons.school,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Noções de informática",
      "icon": Icons.people,
      "itens": [
        {"title": "Excel", "value": "excel"},
        {"title": "Power point,", "value": "powerpoint"},
        {"title": "Programação", "value": "programação"},
        {"title": "Word", "value": "word"}
        ],
    },
    {
      "title": "Opção de Faculdade",
      "icon": Icons.online_prediction,
      "error": null,
      "maxLength": 100,
      "type": TextInputType.number,
      "textFormater": ''
    },
    {
      "title": "Grupo de usuário",
      "icon": Icons.people,
      "itens": [
        {"title": "", "value": ""}],
    },
  ];
  var noteInputs = [
    {
      "title": "Nota",
      "icon": Icons.book,
      "error": null,
      "maxLength": 6,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Aluno",
      "icon": Icons.people,
      "itens": [
        {"title": "Gabriel", "value": "Gabriel"},
        {"title": "Joao", "value": "Joao"}],
      "isDropdown": true
    },
  ];

  var horarioInputs = [
    {  
      "title": "Materia",
      "icon": Icons.people,
      "itens": [
        {"title": "Materia 1", "value": "Materia 1"},
        {"title": "Materia 2", "value": "Materia 2"},
        {"title": "Materia 3", "value": "Materia 3"},
        {"title": "Materia 4", "value": "Materia 4"},
        ],
      "isDropdown": true ,
     
    },
     {  
      "title": "Dia da Semana",
      "icon": Icons.people,
      "itens": [
        {"title": "Segunda", "value": "Segunda"},
        {"title": "Terça ", "value": "Terça"},
        {"title": "Quarta", "value": "Quarta"},
        {"title": "Quinta", "value": "Quinta"},
        {"title": "Sexta", "value": "Sexta"},
        ],
      "isDropdown": true ,
     
    },
    {
      "title": "Horário",
      "icon": Icons.people,
      "itens": [
        {"title": "18:50-19:40", "value": "18:50-19:40"},
        {"title": "19:40-20:30", "value": "19:40-20:30"},
        {"title": "20:40-21:30", "value": "20:40-21:30"},
        {"title": "21:30-22:20", "value": "21:30-22:20"},
        ],
      "isDropdown": true ,
    },
  ];
  
}