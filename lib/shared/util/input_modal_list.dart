import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Financial/billsToPay/bills_to_pay_controller.dart';
import 'package:unipam_mobile/modules/app/Financial/billsToReceive/bills_to_receive_controller.dart';
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

class FonancialInputs {
  List billsToPayInput = [
    {
      "title": "Número do Título",
      "icon": Icons.assessment_outlined,
      "error": "campo obrigatório",
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": BillsToPayController.instance.numtitulo
    },
    {
      "title": "Data de cadastro",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '##/##/####',
      "isDropdown": false,
      "controller": BillsToPayController.instance.dataCadastro
    },
    {
      "title": "Tipo de cobrança",
      "itens": [
        {"title": "boleto bancário", "value": "boleto bancário"},
        {"title": "dinheiro", "value": "dinheiro"}
      ],
      "isDropdown": true
    },
    {
      "title": "Descrição",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": BillsToPayController.instance.descricao
    },
    {
      "title": "Data da emissão",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '##/##/####',
      "isDropdown": false,
      "controller": BillsToPayController.instance.dataEmissao
    },
    {
      "title": "Vencimento",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '##/##/####',
      "isDropdown": false,
      "controller": BillsToPayController.instance.vencimento
    },
    {
      "title": "Valor do título",
      "icon": Icons.assessment_outlined,
      "error": "campo obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '########.##',
      "isDropdown": false,
      "controller": BillsToPayController.instance.valorTitulo
    },
    {
      "title": "Fornecedor",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": BillsToPayController.instance.fornecedor
    },
  ];
}

class ReceiveInputs {
  List billsToReceive = [
    {
      "title": "Lançamento",
      "icon": Icons.code,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Data de Emissão",
      "icon": Icons.title,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.datetime,
      "textFormater": '##/##/##',
      "isDropdown": false
    },
    {
      "title": "Vencimento",
      "icon": Icons.title,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.datetime,
      "textFormater": '##/##/##',
      "isDropdown": false
    },
    {
      "title": "Data do ultimo recebimento",
      "icon": Icons.edit_location_alt_outlined,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '##/##/####',
      "isDropdown": false
    },
    {
      "title": "Portador",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Cliente",
      "icon": Icons.date_range,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Nome Cliente",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Parcela",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 10,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Referente",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Valor Parcela",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Valor Pago",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Acréscimo",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Descontos",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Valor a Receber",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Vendedor",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Nome do Vendedor",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Comissão",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Valor da Comissão",
      "icon": Icons.volume_down,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
  ];
}
