// ignore_for_file: file_names, non_constant_identifier_names

class MatchModel{
late  String domicile;
late String but_domicile;
late  String exterieur;
late String but_exterieur;
late String date;
late String type_vip;
late  String id;
  MatchModel({required this.domicile,required this.exterieur,required this.but_domicile,required this.but_exterieur,required this.date,required this.type_vip,required this.id});

  factory MatchModel.fromJson(Map<dynamic, dynamic> j){
    return MatchModel(
      id: j["id"],
      domicile: j["domicile"],
      but_domicile: j["but_domicile"],
      exterieur: j["exterieur"],
      but_exterieur: j["but_exterieur"],
      date: j["date"],
      type_vip: j["type_vip"]
    );
  }
   Map toMap(){
     return{
       "id":id,
      "domicile":domicile,
      "but_domicile":but_domicile,
      "exterieur":exterieur,
      "but_exterieur":but_exterieur,
      "date":date,
      "type_vip":type_vip
     };
   }
}