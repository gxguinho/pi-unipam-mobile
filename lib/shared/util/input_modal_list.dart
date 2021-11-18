import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Events/CategoryEvents/CategoryEventsController.dart';
import 'package:unipam_mobile/modules/app/library/readers/readers_controller.dart';

class LibraryInputs {
  List authorsInput = [
    {
      "title": "Nome",
      "icon": Icons.people,
      "error": "campo obrigatório",
      "maxLength": 150,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
  ];
  List readersInput = [
    {
      "title": "Nome",
      "icon": Icons.people,
      "error": "campo obrigatório",
      "maxLength": 150,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.nome
    },
    {
      "title": "CPF",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '###.###.###-##',
      "isDropdown": false,
      "controller": ReadersController.instance.cpf
    },
    {
      "title": "RG",
      "icon": Icons.assignment_ind,
      "error": "Campo Obrigatório",
      "maxLength": 14,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.rg
    },
    {
      "title": "Email",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.email
    },
    {
      "title": "Telefone fixo",
      "icon": Icons.phone,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) ####-####',
      "isDropdown": false,
      "controller": ReadersController.instance.telefoneFixo
    },
    {
      "title": "Telefone celular",
      "icon": Icons.phone_android,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) #####-####',
      "isDropdown": false,
      "controller": ReadersController.instance.telefoneCelular
    },
    {
      "title": "CEP",
      "icon": Icons.door_sliding_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": "#####-###",
      "isDropdown": false,
      "controller": ReadersController.instance.cep
    },
    {
      "title": "Logradouro",
      "icon": Icons.add_road,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.logradouro
    },
    {
      "title": "Número",
      "icon": Icons.format_list_numbered,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.numero
    },
    {
      "title": "Bairro",
      "icon": Icons.edit_road_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.bairro
    },
    {
      "title": "Complemento",
      "icon": Icons.edgesensor_low_rounded,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance.complemento
    },
  ];
  List categoryInput = [
    {
      "title": "Categoria",
      "icon": Icons.people,
      "error": "campo obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
  ];
  List languageInput = [
    {
      "title": "Idioma",
      "icon": Icons.people,
      "error": "campo obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
  ];
  List publisherInputs = [
    {
      "title": "Nome da editora",
      "icon": Icons.people,
      "error": "campo obrigatório",
      "maxLength": 100,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
  ];
  var reservationInputs = [
    {
      "title": "Pessoa",
      "itens": [
        {"title": "Roberto", "value": "Roberto"},
        {"title": "Sandro", "value": "Sandro"}
      ],
      "isDropdown": true
    },
    {
      "title": "Livro",
      "itens": [
        {"title": "Herry Poter", "value": "Herry Poter"},
        {"title": "Programação", "value": "Programação"}
      ],
      "isDropdown": true
    },
  ];
  var booksInput = [
    {
      "title": "Código",
      "icon": Icons.code,
      "error": null,
      "maxLength": 20,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Título",
      "icon": Icons.title,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Autores",
      "itens": [
        {"title": " Saramago ", "value": "Saramago "},
        {"title": "Edgar", "value": "Edgar"}
      ],
      "isDropdown": true
    },
    {
      "title": "Edição",
      "icon": Icons.edit_location_alt_outlined,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Volume",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Ano",
      "icon": Icons.date_range,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Editora",
      "itens": [
        {"title": "012BK", "value": "012BK"},
        {"title": "Robert B.K", "value": " Robert B.K"}
      ],
      "isDropdown": true
    },
    {
      "title": "Idioma",
      "itens": [
        {"title": "Portugues", "value": "Portugues"},
        {"title": "Ingles", "value": "Ingles"}
      ],
      "isDropdown": true
    },
    {
      "title": "Categoria",
      "itens": [
        {"title": "Tecnologia", "value": "Tecnologia"},
        {"title": "Ficção", "value": "Ficção"}
      ],
      "isDropdown": true
    },
    {
      "title": "Quantidade de exemplares",
      "icon": Icons.auto_awesome_outlined,
      "error": null,
      "maxLength": 5,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Quantidade de exemplares disponíveis",
      "icon": Icons.auto_awesome_outlined,
      "error": null,
      "maxLength": 5,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": ReadersController.instance
    },
    {
      "title": "Localização",
      "icon": Icons.location_city,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
    }
  ];
}

class EventsInputs {
  var eventsCategory = [
    {
      "title": "Nome Categoria",
      "icon": Icons.people,
      "error": null,
      "maxLength": 150,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
    }
  ];
}

class GerenciarEventsInputs {
  var manageEvents = [
    {
      "title": "Nome do Evento",
      "icon": Icons.flag,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
    },
    {
      "title": "Descrição do Evento",
      "icon": Icons.category,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
    },
    {
      "title": "Endereço do Evento",
      "icon": Icons.add_road,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
    },
    {
      "title": "Tipo Do Evento",
      "icon": Icons.event_available_outlined,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
    },
    {
      "title": "Categoria",
      "itens": CategoryEventsController.instance.category
          .map((e) => {"value": e['nome'], "title": e['nome']})
          .toList(),
      "isDropdown": true
    },
    {
      "title": "Numero De Vagas",
      "icon": Icons.how_to_reg_outlined,
      "error": null,
      "maxLength": 5,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
    },
    {
      "title": "Data De Inicio",
      "icon": Icons.date_range_outlined,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####',
      "isDropdown": false,
    },
    {
      "title": "Data De Término",
      "icon": Icons.date_range_outlined,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####',
      "isDropdown": false,
    },
    {
      "title": "Data De Inscrição",
      "icon": Icons.date_range_outlined,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####',
      "isDropdown": false,
    },
    {
      "title": "Horário Do Evento",
      "icon": Icons.schedule_outlined,
      "error": null,
      "maxLength": 5,
      "type": TextInputType.datetime,
      "textFormater": '##:##',
      "isDropdown": false,
    }
  ];
}
