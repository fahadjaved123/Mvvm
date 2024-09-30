
import 'Base_api_services.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:mvvm/Data/Network/Network_Api_services.dart';
import 'package:mvvm/Data/app_Exception.dart';
class NetworkApiservice extends BaseApiServisec{
  @override
  Future getGetapiRespone(String Url) async{
    dynamic responseJson;
    try{
      final respons=await http.get(Uri.parse(Url)).timeout(Duration(seconds: 10));
      responseJson=ReturnResponse(respons);
    } on Object  {
      throw FetchDataException('');
    }

    return responseJson;
  }

  @override
  Future getPostapiResponse(String Url,dynamic data) async{
    dynamic responseJson;
    try
    {
      Response response=await post(
          Uri.parse(Url),
          body: data,

      ).timeout(Duration(seconds: 10));
      responseJson=ReturnResponse(response);
    } on SocketException{
      throw FetchDataException('NO internet connection');
    }
    catch(e){
      throw e;
    }
    return responseJson;
  }
  dynamic ReturnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw  BadResponseException('error');
      default:
        throw FetchDataException('error in communicaton to service '
            + "status code is " + response.body.toString());
    }


  }

}