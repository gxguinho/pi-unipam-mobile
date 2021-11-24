import 'package:dio/dio.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';

class getAuthDio {
  Dio authDio = Dio(
      BaseOptions(
        baseUrl: "https://unipamapi.devjhon.com/",
        headers: {"Authorization": AppController.instance.token},
      ),
  );
}