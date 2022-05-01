import 'package:fixed_draw/model/matchModel.dart';
import 'package:fixed_draw/service/service.dart';
import 'package:flutter/material.dart';

class ScreenClassique extends StatefulWidget {
  const ScreenClassique({Key? key}) : super(key: key);

  @override
  State<ScreenClassique> createState() => _ScreenClassiqueState();
}

class _ScreenClassiqueState extends State<ScreenClassique> {
  List<MatchModel> matchModel = [];
  getData() async {
    var data = await Service.getMatchVip();
    if (data != null) {
      matchModel.clear();
      for (Map i in data) {
        setState(() {
          matchModel.add(MatchModel.fromJson(i));
        });
      }
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
        title: const Text('Match Classiques'),
        actions: [IconButton(onPressed: getData, icon: const Icon(Icons.refresh))],
      ),
      backgroundColor: Colors.green[100],
      body: Center(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(15.0),
              child: textAvecStyle(
                  "Retrouvez ici les scores des matchs établis par nos puissants algorithmes de predictions.\nPour avoir des scores precis à 100%, allez sur la rubrique “Espace VIP”. ",
                  textAlign: TextAlign.left)),
          Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textAvecStyle('Domicile', fontWeight: FontWeight.bold),
                textAvecStyle('Score',
                    fontWeight: FontWeight.bold, color: Colors.red[900]),
                textAvecStyle('Exterieur', fontWeight: FontWeight.bold)
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: textAvecStyle(
                          match.domicile.toUpperCase(),
                          maxLine :2
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        child: textAvecStyle(
                            match.but_domicile + ' - ' + match.but_exterieur,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: textAvecStyle(
                          match.exterieur.toUpperCase(),
                          maxLine :2
                        ),
                      )
                    ],
                  )),
                );
              },
            ),
          )
        ],
      )),
    );
  }

  Text textAvecStyle(String data,
      {color = Colors.black,
      fontSize = 15.0,
      fontWeight = FontWeight.normal,
      textAlign = TextAlign.center,
      maxLine = 10}) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
