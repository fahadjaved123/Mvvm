import 'package:flutter/cupertino.dart';
import 'package:mvvm/Data/responce/Api_responce.dart';
import 'package:mvvm/Model/Movies_list_Model.dart';
import 'package:mvvm/Resporstory/Home_Reporstory.dart';
import 'package:mvvm/View_model/user_view_model.dart';

class HomeviewviewModel with ChangeNotifier{
 final _myrepo=HomeReporstry();
 ApiResponse<MoviesListModel> Usemodel=ApiResponse.loading();
 SetApireponse(ApiResponse<MoviesListModel> reponse){
   Usemodel=reponse;
   notifyListeners();
 }
 Future<void> FetchMoviesList()async{
   SetApireponse(ApiResponse.loading());

   _myrepo.MoviesApi().then((value){
     SetApireponse(ApiResponse.Completed((value)));

   }).onError((Error,StackTrace){
     SetApireponse(ApiResponse.Error((Error.toString())));
   });
 }

}