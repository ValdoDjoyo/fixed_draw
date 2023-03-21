// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  static getMatchVip() async {
    final response = await http.get(Url.getMatchVip);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
  static getSimpleMatch() async {
    final response = await http.get(Url.getSimpleMatch);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
  static getMatchVipAfter() async {
    final response = await http.get(Url.getMatchVipAfter);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}

class Url {
  static String getMatchVip = 'https://fixed-draw.tolitech.cm/MatchController/getMatchVip';
  static String getSimpleMatch = 'https://fixed-draw.tolitech.cm/MatchController/getMatchSimple';
  static String getMatchVipAfter = 'https://fixed-draw.tolitech.cm/MatchController/getMatchVipAfter';
}