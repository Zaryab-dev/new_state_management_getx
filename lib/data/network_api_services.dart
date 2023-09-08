
import 'dart:convert';
import 'dart:io';

import 'package:new_state_management_getx/data/app_exception.dart';
import 'package:new_state_management_getx/data/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiURl {


  @override
  Future<dynamic> getAPi(String url) async{
    dynamic responseJson;
    try{
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut();
    }
      return responseJson;
  }
  @override
  Future<dynamic> postAPi(var data , String url) async{
    dynamic responseJson;
    try{
      var response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut();
    }
      return responseJson;
  }



  dynamic returnResponse(http.Response response) {
    switch(response.statusCode) {
      case 200 : dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 400 : throw InvalidUrlException('');
      default : throw FetchDataException('');
    }
  }
}