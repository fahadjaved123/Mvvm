
import 'package:mvvm/Data/Network/Base_api_services.dart';
import 'package:mvvm/Data/Network/Network_Api_services.dart';
import 'package:mvvm/Res/App_Url.dart';

class AuthReprostory{
  BaseApiServisec apiServisec=NetworkApiservice();
  Future<dynamic> LoginApi(dynamic data)async{
    try{
      dynamic response=await apiServisec.getPostapiResponse
        (AppEndpoints.LoginApiEndpoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> SignUpApi(dynamic data)async{
    try{
      dynamic response=await apiServisec.getPostapiResponse
        (AppEndpoints.RegistorApiEndPoint, data);
      return response;
    }catch(e) {
      throw e;
    }
    }
  }
