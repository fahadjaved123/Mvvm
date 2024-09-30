import 'package:flutter/material.dart';
import 'package:mvvm/Data/responce/Status.dart';
class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  // postional Contructor
  ApiResponse(this.data,this.message,this.status);
  // named contructor
  ApiResponse.loading() : status = Status.loading;
  ApiResponse.Completed(this.data):status=Status.completed;
  ApiResponse.Error(this.message):status=Status.error;
  @override
  String toString(){
    return "Status : $status \n Data :$data \n Message : $message";
  }
}