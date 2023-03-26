import 'package:dio/dio.dart';

class DioHelper
{
 static late Dio dio;

 static init()
 {
  dio = Dio(
   BaseOptions(
    baseUrl: "https://api.openweathermap.org" ,
    receiveDataWhenStatusError: true ,
   ),
  );
 }
 // To Get Data From API
 void getDate({
  required String url ,
  Function() ? beforSend,
  Function(Map<String,dynamic>data)? onSuccess,
  Function(dynamic error)? onError ,
  Map<String, dynamic>? query ,
 }) async
 {
  dio.options.headers={
   'Content-Type': 'application/json',
  };
  return dio.get(url , queryParameters: query,).then((resp)
  {
   if(onSuccess !=null)
   {
    onSuccess(resp.data);
   }
  }).catchError((e){
   onError!(e);
  }) ;
 }

 // To Send Data To API

 static Future<Response> postDate({
  required String url ,
  required Map<String, dynamic> data ,
  String ?token})
 {
  dio.options.headers={
   'Content-Type': 'application/json',
  };
  return dio.post(
      url,
      data: data
  );
 }


 static Future<Response> putDate({
  required String url ,
  required Map<String, dynamic> data ,
  String ?token})
 {
  dio.options.headers={
   'Content-Type': 'application/json',
  };
  return dio.put(
      url,
      data: data
  );
 }
}