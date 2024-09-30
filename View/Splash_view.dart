import 'package:flutter/material.dart';
import 'package:mvvm/View_model/Services/Splach_services.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();

}


class _SplashViewState extends State<SplashView> {
  SplashService splashService=SplashService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkAutehtication(context);
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Splash Screen,',style: TextStyle(fontSize: 30),)),
          ],
        ),
      );

  }
}
