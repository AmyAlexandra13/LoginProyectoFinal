

import 'package:flutter/material.dart';
import 'package:login/Pages/sing_up_page.dart';

import 'login_page.dart';

class LoginAndSingUp  extends StatefulWidget{
  const LoginAndSingUp ({super.key});
  
  @override
  State<LoginAndSingUp>createState()=> _LoginAndSignUpState();
  }

  class _LoginAndSignUpState extends State<LoginAndSingUp>{
    bool islogin=false;
    void tooglePage(){
      islogin=!islogin;
    }
   @override
   Widget build(BuildContext context){
    if(islogin){
      return const LoginPage();
    }else{
      return const SingUp();
    }
   } 
  }