import 'package:fixed_draw/model/matchModel.dart';
import 'package:fixed_draw/service/service.dart';
import 'package:fixed_draw/service/serviceCompte.dart';
import 'package:fixed_draw/widget/loading.dart';
import 'package:flutter/material.dart';

class ScreenVip extends StatefulWidget {
  const ScreenVip({Key? key}) : super(key: key);

  @override
  State<ScreenVip> createState() => _ScreenVipState();
}

class _ScreenVipState extends State<ScreenVip> {
  List<MatchModel> matchModel = [];
  bool load = false;
  getData() async {
    var data = await Service.getMatchVip();
    if (data != null) {
      matchModel.clear();
      for (Map i in data) {
        setState(() {
          matchModel.add(MatchModel.fromJson(i));
        });
      }
      setState(() {
        load = true;
      });
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
          IconButton(
              onPressed: () {
                setState(() {
                  load = false;
                });
                getData();
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: (() async {
                await ServiceCompte.logout();
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.logout, color: Colors.white)),
        ],
      ),
      backgroundColor: Colors.green[100],
      body: Center(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(15.0),
              child: textAvecStyle(
                  "Bienvenu dans l'espace VIP\nLes scores exacts de certains matchs serons communiqué dans cet espce avec une precision de 100% et tous les jours.\nBon gain à toi.",
                  textAlign: TextAlign.left)),
          textAvecStyle('Journée d\'aujourdhui', fontWeight: FontWeight.bold),
          Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textAvecStyle('Domicile', fontWeight: FontWeight.bold),
                textAvecStyle('Pronnostic',
                    fontWeight: FontWeight.bold, color: Colors.red[900]),
                textAvecStyle('Exterieur', fontWeight: FontWeight.bold)
              ],
            ),
          ),
          !load
              ? const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Loading(),
                )
              : matchModel.isEmpty
                  ? Card(
                      color: Colors.green[200],
                      child: SizedBox(
                        height: 130.0,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.no_accounts,
                              color: Color.fromARGB(255, 229, 250, 225),
                              size: 50.0,
                            ),
                            textAvecStyle(
                                "Y'a aucunes donnée pour l'instant, Revénez plus tard"),
                          ],
                        )),
                      ),
                    )
                  : Expanded(
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
                                  child: textAvecStyle(
                                      match.exterieur.toUpperCase(),
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
