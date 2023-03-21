import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:fixed_draw/login.dart';
import 'package:fixed_draw/screen_classique.dart';
import 'package:fixed_draw/screen_historique_vip.dart';
import 'package:fixed_draw/screen_vip.dart';
import 'package:fixed_draw/service/serviceCompte.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fixed Draw',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Fixed Draw'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Uri _url = Uri.parse('https://t.me/FIXED_DRAW_VIP');
  final Uri num = Uri.parse('sms:+237655537787');
  final Uri tel = Uri.parse('tel:+237655537787');

  void _launchURL() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) throw 'Could not launch $_url';
  }

  void _launchSMS() async {
    if (!await launchUrl(
      num,
      mode: LaunchMode.externalApplication,
    )) throw 'Could not launch $num';
  }

  void _launchCALL() async {
    if (!await launchUrl(
      tel,
      mode: LaunchMode.externalApplication,
    )) throw 'Could not launch $tel';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: getHistory, icon: const Icon(Icons.history))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.green[100],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Fixed Draw',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Message à l\'admin'),
              onTap: _launchSMS,
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Appel vocal à l\'admin'),
              onTap: _launchCALL,
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Parametres'),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 85.0,
            ),
            const Padding(padding: EdgeInsets.all(13.0)),
            ElevatedButton(
              onPressed: getMatchClassique,
              child: textAvecStyle('Résultats classiques',
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 80), elevation: 5.0),
            ),
            const Padding(padding: EdgeInsets.all(13.0)),
            ElevatedButton(
              onPressed: getMatchVip,
              child: textAvecStyle('Espace VIP',
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 80), elevation: 5.0),
            ),
            const Padding(padding: EdgeInsets.all(13.0)),
            ElevatedButton(
              onPressed: _launchURL,
              child: textAvecStyle('Rejoindre notre chaine télégram',
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 80), elevation: 5.0),
            ),
          ]),
        ),
      ),
    );
  }

  Text textAvecStyle(String data,
      {color = Colors.black, fontSize = 15.0, fontWeight = FontWeight.normal}) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  void getMatchClassique() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const ScreenClassique();
    }));
  }

  void getMatchVip() {
    checkSession();
  }

  void checkSession() async {
    String pass = await ServiceCompte.getCompteSession();
   
    if (pass != "") {
      authentification(pass);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const Login();
      }));
    }
  }

  void getHistory() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const HistoriqueVip();
    }));
  }

  void authentification(String loginText) async {
    final response = await http.post(
        'https://fixed-draw.tolitech.cm/LoginController/login',
        body: {"pass": loginText});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data;
      if (result['etat'] == 1) {
        ServiceCompte.SaveCompteSession(loginText);

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const ScreenVip();
        }));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const Login();
        }));
      }
    }
  }
}
