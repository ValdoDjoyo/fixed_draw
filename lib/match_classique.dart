import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C'];
        final List<int> colorCodes = <int>[600, 500, 100];
class MatchClassique extends StatelessWidget {
  final String title;
  const MatchClassique({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.green[100],
      body:  Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child:  textAvecStyle("Retrouvez ici les scores des matchs établis par nos puissants algorithmes de predictions.\nPour avoir des scores precis à 100%, allez sur la rubrique “Espace VIP”. ",textAlign:TextAlign.left )
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
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    margin: const EdgeInsets.all(6.0),
                    color: Colors.green[400],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 
                          textAvecStyle(' Real Mardid ${entries[index]}',), 
                          textAvecStyle('2 - 4', fontWeight: FontWeight.bold,color: Colors.red[900]), 
                          Text('Barcelone ${entries[index]} ')
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