import 'package:dio/dio.dart';
import 'package:omar_ahmed_flutter/constants/strings.dart';

class ApiServices{
  late Dio dio;
  ApiServices(){
   BaseOptions baseOptions= BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(days: 0,hours: 0,seconds: 30),
      receiveTimeout:Duration(days: 0,hours: 0,seconds: 30),
      receiveDataWhenStatusError: true
    );
    dio=Dio(baseOptions);
  }
  Future<Map<String,dynamic>> getAllCharacters ()async{
    try{
      Response response= await dio.get("character");
      if(response.statusCode==200){
        return response.data;
      }
      else{
        return {};
      }
    }catch(error){
      print("the Error : "+error.toString());
      print(StackTrace);
      return {};
    }
  }
}