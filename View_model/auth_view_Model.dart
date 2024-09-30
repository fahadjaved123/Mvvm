import 'package:flutter/cupertino.dart';
import 'package:mvvm/Model/User_model.dart';
import 'package:mvvm/Resporstory/Auth_reprostory.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:mvvm/Utitls/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/View_model/user_view_model.dart';
import 'package:provider/provider.dart';
class AuthViewmodel with ChangeNotifier{

  final _myrepo=AuthReprostory();
  bool _loading=false;
  bool get loading=>_loading;
  setloading(bool value){
    _loading=value;
    notifyListeners();
  }

  Future<void> LoginApi(dynamic data,BuildContext context)async{
    setloading(true);
    _myrepo.LoginApi(data).then((value){
      final pre=Provider.of<UserviewModel>(context,listen: false);
      pre.userSave(
        UserModel(
          token: value['token'].toString(),
        )
      );
      Navigator.pushNamed(context, RoutesName.home);
      setloading(false);
      Utils.Flashbarmessage("Login successfuly", context);
    }).onError((error,StackTrace){
      setloading(false);
        Utils.Flashbarerrormessage(error.toString(), context);
    });
  }
  Future<void> SignUpApi(dynamic data,BuildContext context)async{
    setloading(true);
    _myrepo.SignUpApi(data).then((value){
      Navigator.pushNamed(context, RoutesName.home);
      setloading(false);
      Utils.Flashbarmessage('SignUp Successfuly', context);
    }).onError((error,StackTrace){
      Utils.Flashbarerrormessage(error.toString(), context);
      setloading(false);
    });
  }
}