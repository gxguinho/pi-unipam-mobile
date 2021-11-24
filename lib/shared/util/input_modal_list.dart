import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/academic/students/students_controller.dart';
import 'package:unipam_mobile/modules/app/Events/CategoryEvents/CategoryEventsController.dart';
import 'package:unipam_mobile/modules/app/Financial/billsToPay/bills_to_pay_controller.dart';
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
      "controller": "ReadersController"
    },
    {
      "title": "CPF",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '###.###.###-##',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "RG",
      "icon": Icons.assignment_ind,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Email",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Telefone fixo",
      "icon": Icons.phone,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) ####-####',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Telefone celular",
      "icon": Icons.phone_android,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) #####-####',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "CEP",
      "icon": Icons.door_sliding_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": "#####-###",
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Logradouro",
      "icon": Icons.add_road,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Número",
      "icon": Icons.format_list_numbered,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Bairro",
      "icon": Icons.edit_road_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": "ReadersController"
    },
    {
      "title": "Complemento",
      "icon": Icons.edgesensor_low_rounded,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false,
      "controller": "ReadersController"
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

class AcademicInputs {
   var studentsInputs = [
    {
      "title": "Nome",
      "icon": Icons.people,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.name,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "CPF",
      "icon": Icons.assessment_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": '###.###.###-##',
      "isDropdown": false
    },
    {
      "title": "RG",
      "icon": Icons.assignment_ind,
      "error": "Campo Obrigatório",
      "maxLength": 8,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Orgão expedidor",
      "icon": Icons.corporate_fare_sharp,
      "error": null,
      "maxLength": 50,
      "type": TextInputType.text,
      "textFormater": ''
      ,"isDropdown": false
    },
    {
      "title": "Data de nascimento",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####',
      "isDropdown": false
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
      ],
      "isDropdown": true
    },
    {
      "title": "Sexo",
      "error": null,
      "itens": [
        {"title": "Masculino", "value": "masculino"},
        {"title": "Feminino", "value": "feminino"},
      ],
      "isDropdown": true
    },
    {
      "title": "Nome Do Mãe",
      "icon": Icons.family_restroom,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.name,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Nome Da Pai",
      "icon": Icons.family_restroom,
      "error": null,
      "maxLength": 200,
      "type": TextInputType.name,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "CEP",
      "icon": Icons.door_sliding_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.number,
      "textFormater": "#####-###",
      "isDropdown": false
    },
    {
      "title": "Logradouro",
      "icon": Icons.add_road,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Número",
      "icon": Icons.format_list_numbered,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Bairro",
      "icon": Icons.edit_road_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Complemento",
      "icon": Icons.edit_rounded,
      "error": "Campo Obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Estado",
      "icon": Icons.people,
      "itens": StudentsController.instance.state,
      "isDropdown": true
    },
    {
      "title": "Cidade",
      "icon": Icons.location_city,
      "itens": StudentsController.instance.city,
      "isDropdown": true
    },
    {
      "title": "Nacionalidade",
      "icon": Icons.flag,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Naturalidade",
      "icon": Icons.outlined_flag_sharp,
      "error": null,
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Email",
      "icon": Icons.email,
      "error": "Campo Obrigatório",
      "maxLength": 75,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Telefone fixo",
      "icon": Icons.phone,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) ####-####',
      "isDropdown": false
    },
    {
      "title": "Telefone celular",
      "icon": Icons.phone_android,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.phone,
      "textFormater": '(##) #####-####',
      "isDropdown": false
    },
    {
      "title": "Curso",
      "error": null,
      "itens": [
        {"title": "", "value": ""},
      ],
      "isDropdown": true
    },
    {
      "title": "Data de matrícula",
      "icon": Icons.date_range,
      "error": "Campo Obrigatório",
      "maxLength": 0,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####',
      "isDropdown": false
    },
    {
      "title": "Data de desligamento",
      "icon": Icons.date_range,
      "error": null,
      "maxLength": 0,
      "type": TextInputType.datetime,
      "textFormater": '##/##/####',
      "isDropdown": false
    },
    {
      "title": "Está Trabalhando",
      "icon": Icons.people,
      "itens": [
        {"title": "Sim", "value": "sim"},
        {"title": "Não", "value": "nao"}
      ],
      "isDropdown": true
    },
    {
      "title": "Local de Trabalho",
      "icon": Icons.work,
      "error": "Campo Obrigatório",
      "maxLength": 100,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Renda Familiar",
      "icon": Icons.attach_money_outlined,
      "error": "Campo Obrigatório",
      "maxLength": 10,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Quantidade de Moradores",
      "icon": Icons.format_list_numbered_sharp,
      "error": "Campo Obrigatório",
      "maxLength": 3,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Ano Letivo",
      "icon": Icons.yard_rounded,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Média Escolar",
      "icon": Icons.school,
      "error": null,
      "maxLength": 4,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
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
      "isDropdown": true
    },
    {
      "title": "Opção de Faculdade",
      "icon": Icons.online_prediction,
      "error": null,
      "maxLength": 100,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Grupo de usuário",
      "icon": Icons.people,
      "itens": [
        {"title": "", "value": ""}
      ],
      "isDropdown": true
    },
  ];
  List classInput = [
      {
        "title": "Nome da turma",
        "icon": Icons.book,
        "error": "campo obrigatório",
        "maxLength": 200,
        "type": TextInputType.text,
        "textFormater": '',
        "isDropdown": false
      },
      {
        "title": "Curso",
        "itens": [
          {"title": " Saramago ", "value": "Saramago "},
          {"title": "Edgar", "value": "Edgar"}],
        "isDropdown": true
      },
      {
        "title": "Quantidade de alunos",
        "icon": Icons.book,
        "error": "campo obrigatório",
        "maxLength": 10,
        "type": TextInputType.number,
        "textFormater": '',
        "isDropdown": false
      },
       {
        "title": "Ano Atual",
        "icon": Icons.date_range,
        "error": "campo obrigatório",
        "maxLength": 4,
        "type": TextInputType.number,
        "textFormater": '',
        "isDropdown": false
      },
      {
        "title": "Previsão de início",
        "icon": Icons.book,
        "error": "campo obrigatório",
        "maxLength": 200,
        "type": TextInputType.text,
        "textFormater": '##/##/####',
        "isDropdown": false
      },
      {
        "title": "Previsão de término",
        "icon": Icons.book,
        "error": "campo obrigatório",
        "maxLength": 200,
        "type": TextInputType.text,
        "textFormater": '##/##/####',
        "isDropdown": false
      },
      {
        "title": "Alunos",
        "itens": [
          {"title": " Saramago ", "value": "Saramago "},
          {"title": "Edgar", "value": "Edgar"}],
        "isDropdown": true
      },
  ];
  List frenquencyInput = [];
  List notesInput = [
    {
      "title": "Nome da atividade",
      "icon": Icons.mode_comment,
      "error": "campo obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Data da atividade",
      "icon": Icons.date_range,
      "error": "campo obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '##/##/####',
      "isDropdown": false
    },
  ];
  List modulesInput = [
    {
      "title": "Nome do módulo",
      "icon": Icons.mode,
      "error": "campo obrigatório",
      "maxLength": 200,
      "type": TextInputType.text,
      "textFormater": '',
      "isDropdown": false
    },
     {
      "title": "Carga horária",
      "icon": Icons.horizontal_distribute,
      "error": "campo obrigatório",
      "maxLength": 5,
      "type": TextInputType.number,
      "textFormater": '',
      "isDropdown": false
    },
    {
      "title": "Professores",
      "itens": [
        {"title": " Saramago ", "value": "Saramago "},
        {"title": "Edgar", "value": "Edgar"}],
      "isDropdown": true
    },
  ];
}