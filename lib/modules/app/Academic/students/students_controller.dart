
class StudentsController {

  static StudentsController instance = StudentsController();

  String name = "";
  int cpf = 0;
  int rg = 0;
  int orgaoExpedidor = 0;
  DateTime dataNacimento = DateTime.now();
  String estadoCivil = "";
  String sexo = "";
  String nomeMae = "";
  String nomePai = "";
  int cep = 0;
  String logradouro = "";
  int numero = 0;
  String bairro = "";
  String complemento = "";
  String estado = "";
  String cidade = "";
  String nacionalidade = ""; 
  String naturalidade = "";
  String email = "";
  int telefoneFixo = 0;
  int telefoneCelular = 0;
  String curso = "";
  String dataMatricula = "";
  String dataDesligamento = "";
  bool trabalhando = false;
  String localTrabalho = "";
  int quantiedadeMoradores = 0;
  double rendaFamiliar = 0.0;
  double mediaEscolar = 0.0;
  String nocaoInformatica = "";
  String opcaoFaculdade = "";
  String grupoUsuario = "";



  
  changeInputText(String text, String title) {
    if(title == "Nome") name = text;
  }

  handleRegisterStudents() {
    print(name);
    print(cpf);
  }

}