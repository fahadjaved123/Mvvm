import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:mvvm/View/Home.dart';
import 'package:mvvm/View/Login_View.dart';
import 'package:mvvm/View/SignUpView.dart';
import 'package:mvvm/View/Splash_view.dart';

class Routes{
  static MaterialPageRoute generateRoutes(RouteSettings setting){
    // final Map<String,dynamic> arg=setting.arguments as Map<String,dynamic>;
    switch(setting.name) {
      case RoutesName.Splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>Home());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginView());
      case RoutesName.SignUp:
        return MaterialPageRoute(builder: (BuildContext context)=>SignupView());

      default:
        return MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
            body: Center(
              child: Text("No route is Defined"),
            ),
          );
        });
    }
    }
  }
