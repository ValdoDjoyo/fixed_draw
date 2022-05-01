import 'package:fixed_draw/login.dart';
import 'package:fixed_draw/screen_classique.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.green[100],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
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
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                  onPressed: () {},
                  child: textAvecStyle('Acceder à la chaine télégram',
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
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const Login();
    }));
  }
}
