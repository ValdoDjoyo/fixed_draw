// ignore_for_file: file_names, non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class ServiceCompte {
  static void SaveCompteSession(String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("pass", pass);
  }

  static getCompteSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pass = pref.getString("pass").toString();
    return pass;
  }
  static logout() async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("pass", "");
  }
}
