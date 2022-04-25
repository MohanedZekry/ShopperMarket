import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://addmission.must.edu.eg/OperaAPI/api/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type' :'application/json',
        }
      ),
        /*BaseOptions(
          baseUrl: "https://student.valuxapps.com/api/",
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type' :'application/json',
            'lang' : 'ar',
          },
        )*/
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query }) async
  {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> login({
    required String path,
    required String email,
    required String password,
  }) async {
    String url = "$path/$email/$password";
    //print(url);
    return dio.get(url);
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    /*dio.options = BaseOptions(
        headers: {
          'lang': 'ar',
        }
    );*/
    return await dio.post(
        path,
        data: data,
        queryParameters: query);
  }
}