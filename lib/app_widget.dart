import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unipam_mobile/modules/app/academic/classes/closedClass_page.dart';
import 'package:unipam_mobile/modules/app/academic/classes/openClass_page.dart';
import 'package:unipam_mobile/modules/app/academic/courses/courses_page.dart';
import 'package:unipam_mobile/modules/app/academic/modules/modules_page.dart';
import 'package:unipam_mobile/modules/app/academic/notes/notes_page.dart';
import 'package:unipam_mobile/modules/app/academic/students/frequency/frequency_page.dart';
import 'package:unipam_mobile/modules/app/library/book/book_page.dart';
import 'package:unipam_mobile/modules/auth/Login/login_page.dart';
import 'package:unipam_mobile/modules/splashScreen/splashScreen_page.dart';
import 'modules/app/academic/academic_page.dart';
import 'modules/app/academic/classes/classes_page.dart';
import 'modules/app/academic/students/students_page.dart';
import 'modules/app/app_controller.dart';
import 'modules/app/Home/home_page.dart';
import 'modules/app/library/authors/authors_page.dart';
import 'modules/app/library/category/category_page.dart';
import 'modules/app/library/language/language_page.dart';
import 'modules/app/library/library_page.dart';
import 'modules/app/library/publishers/publishers_page.dart';
import 'modules/app/library/readers/Readers_page.dart';
import 'modules/app/library/reservations/reservations_page.dart';
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
                '/': (context) => SplashScreen(),
                '/login': (context) => LoginPage(),
                '/forgotpassword': (context) => ForgotPasswordPage(),
                '/emailcheck': (context) => EmailCheckPage(),
                '/newpassword': (context) => NewPasswordPage(),
                "/home": (context) => HomePage(),
                "/library": (context) => LibaryPage(),
                "/academic": (context) => AcademicPage(),
                "/authors": (context) => AuthorsPage(),
                "/readers": (context) => ReadersPage(),
                "/category": (context) => CategoryPage(),
                "/language": (context) => LanguagePage(),
                "/publishers": (context) => PublishersPage(),
                "/reservations": (context) => ReservationsPage(),
                "/books": (context) => BookPage(),
                "/students": (context) => StudentsPage(),
                "/courses": (context) => CoursesPage(),
                "/classes": (context) => ClassesPage(),
                "/openClass": (context) => OpenClass(),
                "/closedClass": (context) => ClosedClass(),
                "/frequency": (context) => FrequencyPage(),
                "/notes": (context) => NotesPage(),
                "/modules": (context) => ModulesPage()
              });
        });
  }
}
