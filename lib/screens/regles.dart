import 'package:flutter/material.dart';
import 'package:jeu_des_themes/data/constants.dart';
import 'package:jeu_des_themes/responsive/size_config.dart';

class Regles extends StatelessWidget {
  static const String id = 'regles_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.deepPurple[900], Colors.lightBlue[900]])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                        child: Text(
                      'Les règles',
                      style: kTitreTextStyle,
                    )),
                    Container(
                        height: SizeConfig.safeBlockVertical * 0.5,
                        color: Colors.white),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Mode normal',
                              style: kCategorieTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*2),
                            child: Text(
                              'Pour chaque thème, les joueurs devront à tour de rôle donner un mot en rapport avec le thème donné. \n\nLe premier joueur à répéter ou à ne pas trouver devra boire 3 gorgées.',
                              style: kRegleTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 4,
                          ),
                          Center(
                            child: Text(
                              'Mode gage',
                              style: kCategorieTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*2),
                            child: Text('Le jeu se joue de la même manière que pour le mode normal, sauf que chaque joueur aura un compteur de défaites.\n\nAu bout de 10 tours,'
                                ' la ou les personnes ayant(s) le plus grand nombre de défaites se verra(-ont) subir un gage défini par le jeu.', style: kRegleTextStyle),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
