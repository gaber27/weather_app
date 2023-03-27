import 'package:dio/dio.dart';

class DioHelper {
 final String? url;
 final Map<String,dynamic>? data;

 DioHelper({ this.url, this.data});

 Dio _dio = Dio();

 void getDate({
  Function()? beforeSend,
  Function(dynamic data)? onSuccess,
  Function(dynamic error)? onError,
 }) {
  _dio.get(url!, queryParameters:this.data).then((response) {
   if (onSuccess != null) {
    onSuccess(response.data);
   }
  }).catchError((e) {
   if (onError != null) {
    onError(e);
   }
  });
 }
}
