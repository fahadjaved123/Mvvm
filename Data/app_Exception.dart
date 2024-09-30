import 'package:flutter/material.dart';
class AppExcepton implements Exception{
  final message;
  final prefix;
  //named Constructor
  AppExcepton({this.message,this.prefix});
  String toString(){
    return '$message$prefix';
  }

}
class FetchDataException extends AppExcepton{
  FetchDataException([String? message]):super(message: 'Internet Connection error');
}
class BadResponseException extends AppExcepton{
  BadResponseException([String? message]):super(message: 'Invalid Request');
}
class UnothrizesRequest extends AppExcepton{
  UnothrizesRequest([String? message]):super(message: "Unothrized Request");
}