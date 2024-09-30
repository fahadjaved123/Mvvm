import 'package:mvvm/Model/Movies_list_Model.dart';

import '../Data/Network/Base_api_services.dart';
import '../Data/Network/Network_Api_services.dart';
import '../Res/App_Url.dart';

class HomeReporstry{
  BaseApiServisec apiServisec=NetworkApiservice();
  Future<MoviesListModel> MoviesApi()async{
    try{
      dynamic response=await apiServisec.getGetapiRespone
        (AppEndpoints.moviesListEndPoint);
      return response=MoviesListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}