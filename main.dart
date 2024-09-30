import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/Utitls/Routes/routes.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:mvvm/View/Home.dart';
import 'package:mvvm/View_model/auth_view_Model.dart';
import 'package:mvvm/View_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>AuthViewmodel()),
          ChangeNotifierProvider(create: (_)=>UserviewModel()),
        ] ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: false,
        ),
        initialRoute: RoutesName.Splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );

  }
}