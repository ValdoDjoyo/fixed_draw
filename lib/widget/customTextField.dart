import 'package:flutter/material.dart';

class CustomTextField{
  final String title;
  final String placeholder;
  final bool ispass;
  String err;
  late String _value;
  CustomTextField({ this.title="", this.placeholder="",this.ispass=false,this.err="Veuillez renseigner ce champ"});
  TextEditingController controller = TextEditingController();
  TextFormField textFormField(){
    return TextFormField(
      controller: controller,
      onChanged: (e){
        _value = e;
      },
      obscureText: ispass,
      validator: (e)=>e!.isEmpty?err:null,
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: title,
        border:const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        )
      ),
    );
  }
  String get value{
  return _value;
}
}