import 'package:dio/dio.dart';

class DioShopHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
          baseUrl: "https://student.valuxapps.com/api/",
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type' :'application/json',
            'lang' : 'ar',
            'Authorization' : 'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV'
          },
        ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query }) async
  {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(
        path,
        data: data,
        queryParameters: query);
  }
}