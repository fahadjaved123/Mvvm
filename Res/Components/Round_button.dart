import 'package:flutter/material.dart';
import 'package:mvvm/Res/Colors.dart';
import 'package:mvvm/View_model/auth_view_Model.dart';
class RoundButton extends StatelessWidget {
  final auth=AuthViewmodel;
  final String title;
  final bool loading;
  final VoidCallback onprss;
  const RoundButton({super.key,required this.title
    ,required this.onprss,
    this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onprss,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.Buttoncolor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColor.blackcolor,
            width: 2,
          )
        ),
        width: 300,
        height: 50,
        child: Center(
            child: loading ? CircularProgressIndicator
          (color: Colors.white,strokeWidth: 2,):
            Text(title,style:
        TextStyle(color: AppColor.withcolor,fontSize: 20),)),
      ),
    );
  }
}
