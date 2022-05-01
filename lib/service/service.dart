// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:http/http.dart' as http;

class Service{
  static getMatchVip() async{
    final response = await http.get(Url.getMatchVip);
    if(response.statusCode == 200){
      return json.decode(response.body) ;
    }else{
      return null;
    }
  }
}

class Url{
  static String getMatchVip = 'https://fixed-draw.royaumebamougoum.cm/public/MatchController/getMatchVip';
}