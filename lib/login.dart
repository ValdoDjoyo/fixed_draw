// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:fixed_draw/screen_vip.dart';
import 'package:fixed_draw/widget/customTextField.dart';
import 'package:fixed_draw/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _loading = false;
  String erreur="";
  void authentification(String loginText) async{
    setState(() {
      _loading = true;
    });
    final response = await http.post('https://fixed-draw.royaumebamougoum.cm/public/LoginController/login',body: {"pass": loginText});

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data;
      if(result['etat'] == 2){
        setState(() {
          _loading = false;
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return ScreenVip();
          }));
        });
      }
      else{
          setState(() {
          _loading = false;
          erreur = result['msg'];
        });
      }
    }
  }
  

  CustomTextField login = CustomTextField(title: "login", placeholder: "Entreer votre code",);
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return _loading? Loading(): Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: SingleChildScrollView(
          child:Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo.png', height: 85.0,),
                  const SizedBox(height: 20,),
                  const Text(
                    "Veuillez vous authentifier pour acceder à l'espace vip",
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  const SizedBox(height: 30,),
                  login.textFormField(),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: (){
                      if(_key.currentState!.validate()){
                        authentification(login.value);
                      }
                    }, 
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Connexion", style: TextStyle(fontSize: 20),)
                    )
                  ),
                  Column(
                    children:[ 
                      const Text("Vous n'avez pas de pass? Veuillez", style: TextStyle(fontSize: 15.0),),
                      FlatButton(onPressed: (){}, child: const Text("Conctactez l'admin")),
                      Text(erreur.isNotEmpty?erreur:"",style: const TextStyle(color: Colors.red),)
                    ]
                  )
                ],
              ),
            )
          ) ,
        )
      ),
    );
  }
}