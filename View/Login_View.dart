import 'package:flutter/material.dart';
import 'package:mvvm/Res/Components/Round_button.dart';
import 'package:mvvm/Utitls/Routes/routes_name.dart';
import 'package:mvvm/Utitls/Utils.dart';
import 'package:mvvm/View_model/auth_view_Model.dart';
import 'package:provider/provider.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailcont=TextEditingController();
  TextEditingController _passwcont=TextEditingController();
  FocusNode emailfocus=FocusNode();
  FocusNode passwfocus=FocusNode();
  ValueNotifier<bool> _visbility=ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print('build');
    final authviewModel=Provider.of<AuthViewmodel>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
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
              Consumer<AuthViewmodel>(
                  builder: (context,value,child){
                    return RoundButton(title: 'Login',
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
                          value.LoginApi(data,context);

                        }
                      },
                    );
                  }),
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.SignUp);
                },
                  child: Text("Don't have account? SignUp")),

            ],
          ),
        ),
      ),
    );
  }
}
