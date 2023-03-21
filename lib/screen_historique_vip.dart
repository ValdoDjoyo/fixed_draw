import 'package:fixed_draw/service/service.dart';
import 'package:flutter/material.dart';

import 'model/matchModel.dart';

class HistoriqueVip extends StatefulWidget {
  const HistoriqueVip({Key? key}) : super(key: key);

  @override
  State<HistoriqueVip> createState() => _HistoriqueVipState();
}

class _HistoriqueVipState extends State<HistoriqueVip> {
  List<MatchModel> matchModel = [];
  getData() async {
    var data = await Service.getMatchVipAfter();
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
        title: const Text('Historique Vip'),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(15.0),
              child: textAvecStyle(
                  "Historique des dernieres predictions de l'espace vip",
                  textAlign: TextAlign.left)),
          textAvecStyle('Journée d\'aujourdhui', fontWeight: FontWeight.bold),
          Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textAvecStyle('Domicile', fontWeight: FontWeight.bold),
                textAvecStyle('Pronostic',
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
                        child: textAvecStyle(match.domicile.toUpperCase(),
                            maxLine: 2),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                        child: textAvecStyle(
                            match.pronostic,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: textAvecStyle(match.exterieur.toUpperCase(),
                            maxLine: 2),
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
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
