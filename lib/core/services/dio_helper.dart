import 'package:dio/dio.dart';

import '../utils/end_point.dart';

class DioHelper{

   static late Dio dio;


  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,

      )

    );

  }

 static Future<Response> getData({
     required String url,
     Map<String,dynamic>? query,
     String lang='en',
     String? token,
})async{
   try{
     return await dio.get(url,queryParameters: query,options:Options (
       validateStatus: (_) => true,
       contentType: Headers.jsonContentType,
       responseType:ResponseType.json,
     ));
   }catch(error){
     print(error.toString());
     rethrow;
   }
}

static Future<Response> postData({
  required String url,
  Map<String,dynamic>? query,
   dynamic data,
  String lang='en',
  String? token,
})async{
  try{
    return   await dio.post(url,queryParameters: query,data: data,options:Options (
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType:ResponseType.json,
    ));
  }catch(error){
    print(error.toString());
    rethrow;
  }

}

   static Future<Response> putData(
       {
         required String url,
         dynamic data,
         Map<String, dynamic>? query,
         String? token,
       }
       ) async {
     try{
       dio.options.headers = {
         'Authorization' : 'bearer $token',
       };
       Response response = await dio.put(
         url,
         data: data,
         queryParameters: query,
       );
       return response;
     }catch(error){
       throw error;
     }
   }

   static Future<Response> deleteData({
     required String url,
     Map<String,dynamic>? query,
     dynamic data,
     String lang='en',
     String? token,
   })async{
     try{
       dio.options.headers = {
         'Authorization' : 'bearer $token',
       };
       return await dio.delete(url,queryParameters: query,data: data);
     }catch(error){
       print(error.toString());
       rethrow;
     }

   }

}