import 'package:fixed_draw/model/matchModel.dart';
import 'package:fixed_draw/service/service.dart';
import 'package:flutter/material.dart';

class ScreenVip extends StatefulWidget {
  const ScreenVip({ Key? key }) : super(key: key);
  

  @override
  State<ScreenVip> createState() => _ScreenVipState();
}

class _ScreenVipState extends State<ScreenVip> {
  List <MatchModel> matchModel = [];
  getData() async{
    var  data  = await Service.getMatchVip();
    if(data != null){
      
      matchModel.clear();
      for(Map i in data ){
        setState(() {
          matchModel.add(MatchModel.fromJson(i));
        });
      }
      print(data);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIP'),
        actions: [
          IconButton(onPressed:  getData, icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.green[100],
      body:  Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child:  textAvecStyle("Bienvenu dans l'espace VIP\nLes scores exacts de certains matchs serons communiqué dans cet espce avec une precision de 100% et tous les jours.\nBon gain à toi.",textAlign:TextAlign.left )
            ),
            Container(
              margin: const EdgeInsets.only(left:15.0, right: 15.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                textAvecStyle('Domicile',fontWeight: FontWeight.bold), 
                textAvecStyle('Score', fontWeight: FontWeight.bold,color: Colors.red[900]), 
                textAvecStyle('Exterieur',fontWeight: FontWeight.bold)
              ],
            ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: matchModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final match = matchModel[index];
                  return Container(
                    height: 50,
                    margin: const EdgeInsets.all(6.0),
                    color: Colors.green[400],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 
                          
                          textAvecStyle(match.domicile,), 
                          textAvecStyle(match.but_domicile+' - '+match.but_exterieur, fontWeight: FontWeight.bold,color: Colors.red[900]), 
                          textAvecStyle(match.exterieur,)
                        ],
                      )
                    ),
                  );
                }  ,  
              ),
            )
          ],
        )
      ),
    );
  }
   Text textAvecStyle(String data,{color =Colors.black, fontSize =15.0,fontWeight = FontWeight.normal, textAlign= TextAlign.center}){
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}