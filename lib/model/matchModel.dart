// ignore_for_file: file_names, non_constant_identifier_names

class MatchModel{
late  String domicile;
late String pronostic;
late  String exterieur;

late String date;
late String type_vip;
late  String id;
  MatchModel({required this.domicile,required this.exterieur,required this.pronostic,required this.date,required this.type_vip,required this.id});

  factory MatchModel.fromJson(Map<dynamic, dynamic> j){
    return MatchModel(
      id: j["id"],
      domicile: j["domicile"],
      pronostic: j["pronostic"],
      exterieur: j["exterieur"],

      date: j["date"],
      type_vip: j["type_vip"]
    );
  }
   Map toMap(){
     return{
       "id":id,
      "domicile":domicile,
      "pronostic":pronostic,
      "exterieur":exterieur,
      "date":date,
      "type_vip":type_vip
     };
   }
}