import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Model/User_model.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:mvvm/View_model/user_view_model.dart';
class SplashService{
  Future<UserModel> getUserData()=>UserviewModel().getUser();
  void checkAutehtication(BuildContext context)async{
    getUserData().then((value) async {
      if(value.token=='null' || value.token?.isEmpty==true){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error,StackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}