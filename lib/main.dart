import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_des_themes/screens/gage.dart';
import 'package:jeu_des_themes/screens/game.dart';
import 'package:jeu_des_themes/screens/home.dart';
import 'package:jeu_des_themes/screens/liste_joueurs.dart';
import 'package:jeu_des_themes/screens/regles.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu des thèmes',
      theme: ThemeData(

      ),
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
          Regles.id: (context) =>Regles(),
          Game.id: (context) => Game(),
          ListeJoueur.id: (context) => ListeJoueur(),
          Gage.id: (context) => Gage(),
        }

    );
  }
}


