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
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 11,
      "type": TextInputType.number,
    },
    {
      "title": "RG",
      "icon": Icons.assignment_ind,
      "error": "Campo Obrigatório",
      "maxLength": 14,
      "type": TextInputType.number,
    },
    {
      "title": "Orgão expedidor",
      "icon": Icons.corporate_fare_sharp,
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
      "itens": [{"title": "Minas Gerais", "value": "MG"}],
    },
    {
      "title": "Sexo",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.text,
      "itens": [{"title": "Minas Gerais", "value": "MG"}],
    },
    {
      "title": "Nome Da Mãe",
      "icon": Icons.family_restroom,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.name,
    },
    {
      "title": "Nome Do Pai",
      "icon": Icons.family_restroom,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.name,
    },
    {
      "title": "CEP",
      "icon": Icons.door_sliding_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "type": TextInputType.number,
    },
    {
      "title": "Logradouro",
      "icon": Icons.add_road,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.number,
    },
    {
      "title": "Número",
      "icon": Icons.format_list_numbered,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
    },
    {
      "title": "Bairro",
      "icon": Icons.edit_road_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.number,
    },
    {
      "title": "Complemento",
      "icon": Icons.edit_rounded,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
    },
    {
      "title": "Estado",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "itens": StudentsController.instance.state,
    },
    {
      "title": "Cidade",
      "icon": Icons.location_city,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "itens": StudentsController.instance.city,
    },
    {
      "title": "Nacionalidade",
      "icon": Icons.flag,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
    },
    {
      "title": "Naturalidade",
      "icon": Icons.outlined_flag_sharp,
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
      "icon": Icons.phone_android,
      "error": "Campo Obrigatório",
      "maxLength": 11,
      "type": TextInputType.number,
    },
    {
      "title": "Curso",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "itens": [{"title": "Minas Gerais", "value": "MG"}],
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
      "itens": [{"title": "Minas Gerais", "value": "MG"}],
    },
    {
      "title": "Local de Trabalho",
      "icon": Icons.work,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.text,
    },
    {
      "title": "Renda Familiar",
      "icon": Icons.attach_money_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
    },
    {
      "title": "Quantidade de Moradores",
      "icon": Icons.format_list_numbered_sharp,
      "error": "Campo Obrigatório",
      "maxLength": 3,
      "type": TextInputType.number,
    },
    {
      "title": "Ano Letivo",
      "icon": Icons.yard_rounded,
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
      "itens": [{"title": "Minas Gerais", "value": "MG"}],
    },
    {
      "title": "Opção de Faculdade",
      "icon": Icons.online_prediction,
      "error": null,
      "maxLength": 100,
      "type": TextInputType.text,
    },
    {
      "title": "Grupo de usuário",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "itens": [{"title": "Minas Gerais", "value": "MG"}],
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