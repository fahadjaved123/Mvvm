import 'package:flutter/material.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../Res/Components/Round_button.dart';
import '../Utitls/Utils.dart';
import '../View_model/auth_view_Model.dart';
class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  TextEditingController _emailcont=TextEditingController();
  TextEditingController _passwcont=TextEditingController();
  FocusNode emailfocus=FocusNode();
  FocusNode passwfocus=FocusNode();
  ValueNotifier<bool> _visbility=ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print('Build');
    final authviewModel=Provider.of<AuthViewmodel>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailfocus,
                controller: _emailcont,
                keyboardType: TextInputType.emailAddress,
                decoration:const InputDecoration(
                  hintText: 'Email',
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value){
                  Utils.fieldfoucchange(context, emailfocus, passwfocus);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _visbility,
                  builder:(context,value,child){
                    return TextFormField(
                      focusNode: passwfocus,
                      controller: _passwcont,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _visbility.value,
                      decoration:InputDecoration(
                        hintText: 'Password',
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                            onTap:(){
                              _visbility.value=!_visbility.value;
                            },
                            child:  Icon(_visbility.value? Icons.visibility_off:
                            Icons.visibility )),
                      ),
                    );
                  }),
              SizedBox(height: 50,),
              Consumer<AuthViewmodel>(builder:(context,value,child){
                return RoundButton( title: 'Sign Up',
                  loading: value.loading,
                  onprss: (){
                    if(_emailcont.text.isEmpty){
                      Utils.Flashbarerrormessage("Please Enter Email ", context);
                    }else if(_passwcont.text.isEmpty){
                      Utils.Flashbarerrormessage('Please Enter password..', context);
                    }else if(_passwcont.text.length<6){
                      Utils.Flashbarerrormessage('Your Password is less than 6', context);
                    }
                    else{
                      Map data={
                        "email":_emailcont.text.toString(),
                        "password":_passwcont.text.toString(),
                      };
                      value.SignUpApi(data,context);

                    }
                  },
                );
              }),
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                  child: Text("Already have Account ? Login ")),

            ],
          ),
        ),
      ),
    );
  }
}
