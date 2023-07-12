// ignore_for_file: avoid_print
import 'package:dio/dio.dart';


class ApiProvider {
  final Dio _dio = Dio();
  final baseUrl = 'http://vbatest.metrdev.com:2472/api/v1/signin';

  Future login(email, password) async{
    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password
    };

    try{
      dynamic response =  await _dio.post(baseUrl,
        data: loginData,
      );
      print("Response: $response");
      return response;
    } on Exception catch (e){
      print(e);
      rethrow;
    }
  }
}