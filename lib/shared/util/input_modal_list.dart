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
    },
    {
      "title": "CPF",
      "icon": Icons.keyboard_control,
      "error": "Campo Obrigatório",
      "maxLength": 11,
      "type": TextInputType.number,
    },
    {
      "title": "RG",
      "icon": Icons.keyboard_control,
      "error": "Campo Obrigatório",
      "maxLength": 14,
      "type": TextInputType.number,
    },
    {
      "title": "Orgão expedidor",
      "icon": Icons.keyboard_control,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.text,
    },
    {
      "title": "Data de nascimento",
      "icon": Icons.date_range,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.datetime,
    },
    {
      "title": "Estado civil",
      "icon": Icons.mark_email_read_outlined,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.text,
      "itens": ["Solteiro", "Casado", "Separado", "Viúvo", "Outro"],
    },
    {
      "title": "Sexo",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.text,
      "itens": ["Masculino", "Feminino"]
    },
    {
      "title": "Nome Da Mãe",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.name,
    },
    {
      "title": "Nome Do Pai",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.name,
    },
    {
      "title": "CEP",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "type": TextInputType.number,
    },
    {
      "title": "Logradouro",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.number,
    },
    {
      "title": "Número",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
    },
    {
      "title": "Bairro",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.number,
    },
    {
      "title": "Complemento",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
    },
    {
      "title": "Estado",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "itens": [StudentsController.instance.getState()],
    },
    {
      "title": "Cidade",
      "icon": Icons.location_city,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "itens": ["Patos de Minas", "Presidente Olegario"],
    },
    {
      "title": "Nacionalidade",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
    },
    {
      "title": "Naturalidade",
      "icon": Icons.people,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.text,
    },
    {
      "title": "Email",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
    },
    {
      "title": "Telefone fixo",
      "icon": Icons.phone,
      "error": "Campo Obrigatório",
      "maxLength": 11,
      "type": TextInputType.number,
    },
    {
      "title": "Telefone celular",
      "icon": Icons.phone,
      "error": "Campo Obrigatório",
      "maxLength": 11,
      "type": TextInputType.number,
    },
    {
      "title": "Curso",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "itens": ["Sistema de Informaçoes"],
    },
    {
      "title": "Data de matrícula",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.datetime,
    },
    {
      "title": "Data de desligamento",
      "icon": Icons.date_range,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.datetime,
    },
    {
      "title": "Está Trabalhando",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "itens": ["Sim", "Não"],
    },
    {
      "title": "Local de Trabalho",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.text,
    },
    {
      "title": "Renda Familiar",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
    },
    {
      "title": "Quantidade de Moradores",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 3,
      "type": TextInputType.number,
    },
    {
      "title": "Renda Familiar",
      "icon": Icons.family_restroom,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
    },
    {
      "title": "Média Escolar",
      "icon": Icons.school,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
    },
    {
      "title": "Noções de informática",
      "icon": Icons.people,
      "error": null,
      "maxLength": 8,
      "itens": ["Excel", "Power Point", "Programação", "Word"],
    },
    {
      "title": "Opção de Faculdade",
      "icon": Icons.email,
      "error": null,
      "maxLength": 100,
      "type": TextInputType.text,
    },
    {
      "title": "Grupo de usuário",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "itens": ["Portal Academico"]
    },
  ];
}

/* celular new MaskTextInputFormatter(
                mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')}) */

                /* 
                cpf new MaskTextInputFormatter(
                mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')})
                 */

                /* 
                  data new MaskTextInputFormatter(
                mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')})
                 */


                /* 
                  cep :   mask: '#####-###', filter: {"#": RegExp(r'[0-9]')})
                 */