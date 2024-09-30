import 'package:flutter/material.dart';
import 'package:mvvm/Model/User_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserviewModel with ChangeNotifier{
  Future<bool> userSave(UserModel user)async{
    final SharedPreferences sp= await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    return true;
  }
  Future<UserModel> getUser()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    final String? token= sp.getString('token');
    return UserModel(
      token:token.toString(),
    );
  }
  Future<bool> remove()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
   await sp.remove('token');
   await sp.clear();
    return true;
  }
}