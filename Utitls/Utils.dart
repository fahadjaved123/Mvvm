import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
class Utils{
  static double averageRating(List<int> rating){
   double avgRating=0;
    for(int i=0;i<rating.length;i++){
      avgRating=avgRating+rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }
  
  
  
  static fieldfoucchange(BuildContext context,
      FocusNode current,
      FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
  static toastmessage(String msg){
    Fluttertoast.showToast(msg: msg,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 15,
    );

  }
  static void Flashbarmessage(String mess,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: mess,
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          flushbarPosition: FlushbarPosition.TOP,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOutBack,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(left: 10,right: 10,top: 15),
          borderRadius: BorderRadius.circular(10),
          icon: Icon(Icons.gpp_good_outlined,color: Colors.white,size: 25,),
        )..show(context));
  }
  static void Flashbarerrormessage(String mess,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: mess,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
          icon: Icon(Icons.error,color: Colors.white,size: 25,),
          forwardAnimationCurve: Curves.easeIn,
          padding: EdgeInsets.all(10.0),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          reverseAnimationCurve: Curves.easeInOutBack,
          borderRadius: BorderRadius.circular(15),
        )..show(context));
  }
  static snackbar(String mess,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.red,
          content: Text(mess)),
    );
  }
}
