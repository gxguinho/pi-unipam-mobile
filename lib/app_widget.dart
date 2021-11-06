import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unipam_mobile/modules/app/Academic/horario/horario.dart';
import 'package:unipam_mobile/modules/app/Academic/manage_curse/manage_curse_page.dart';
import 'package:unipam_mobile/modules/app/Academic/notas/notes_page.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_page.dart';
import 'package:unipam_mobile/modules/app/Library/books/books_page.dart';
import 'package:unipam_mobile/modules/app/Library/loan/loan_page.dart';
import 'package:unipam_mobile/modules/app/Library/Authors/authors_page.dart';
import 'package:unipam_mobile/modules/auth/Login/login_page.dart';
import 'modules/app/Academic/Frequency/frequency_page.dart';
import 'modules/app/Academic/turma/turma.dart';
import 'modules/app/Academic/turma/turma_aberta.dart';
import 'modules/app/Academic/turma/turma_fechada.dart';
import 'modules/app/Academic/reportspage/reports_page.dart';
import 'modules/app/Library/Readers/readers_page.dart';
import 'modules/app/Library/categoria/categoria.dart';
import 'modules/app/Library/editoras/editoras_page.dart';
import 'modules/app/Library/idiomas/idiomas.dart';
import 'modules/app/Library/library_page.dart';
import 'modules/app/Library/reservations/reservations_page.dart';
import 'modules/app/app_controller.dart';
import 'modules/app/Academic/academic_page.dart';
import 'modules/app/Home/home_page.dart';
import 'modules/auth/ForgotPassword/email_check.dart';
import 'modules/auth/ForgotPassword/forgot_password.dart';
import 'modules/auth/ForgotPassword/new_password.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              theme: ThemeData(
                primaryColor: AppController.instance.colorSelected,
                appBarTheme: AppBarTheme(
                    backgroundColor: AppController.instance.colorSelected),
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.light
                    : Brightness.dark,
                fontFamily: GoogleFonts.archivo().toString(),
              ),
              title: "Unipam Mobile",
              initialRoute: '/',
              routes: {
                '/': (context) => LoginPage(),
                '/forgotpassword': (context) => ForgotPasswordPage(),
                '/emailcheck': (context) => EmailCheckPage(),
                '/newpassword': (context) => NewPasswordPage(),
                "/home": (context) => HomePage(),
                "/academic": (context) => AcademicPage(),
                "/students": (context) => StudentsPage(),
                "/notes": (context) => NotesPage(),
                "/frequency": (context) => FrequencyPage(),
                "/turmas": (context) => TurmaPage(),
                "/schedule": (context) => HorarioPage(),
                "/turmaaberta": (context) => TurmaAbertaPage(),
                "/turmafechada": (context) => TurmaFechadaPage(),
                "/reports": (context) => ReportsPage(),
                "/group": (context) => ManageCursePage(),
                "/library": (context) => LibraryPage(),
                "/readers": (context) => ReadersPage(),
                "/loan": (context) => LoanPage(),
                "/books": (context) => BooksPage(),
                "/reservations": (context) => ReservationsPage(),
                "/categoria": (context) => CategoriaPage(),
                "/idiomas": (context) => IdiomasPage(),
                "/editoras": (context) => EditorasPage(),
                "/authors": (context) => AuthorsPage(),
              });
        });
  }
}
