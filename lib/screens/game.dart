import 'package:flutter/material.dart';
import 'package:jeu_des_themes/data/themes.dart';
import 'package:jeu_des_themes/responsive/size_config.dart';
import 'dart:math';
import 'package:jeu_des_themes/data/constants.dart';

Themes themes=Themes();

class Game extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int nb;

  @override
  void initState() {
    themes.initGame();
    nb=Random().nextInt(themes.themes.length);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
            colors: [Colors.deepPurple[900], Colors.lightBlue[900]]
            //colors:[Color(0xFF61ACED),Color(0xFF84F5E4)]
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.safeBlockVertical*10,),
              Text('Tour n°${themes.getNbTour().toString()}',style: kTourTextStyle,textAlign: TextAlign.center,),
              Text(themes.themes[nb].categorie,style: kCategorieTextStyle,),
              SizedBox(height: SizeConfig.safeBlockVertical*10,),
              Text(themes.themes[nb].nom,style: kThemeTextStyle,textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.safeBlockVertical*10,),
              FlatButton(
                onPressed: () {
                  setState(() {
                    themes.nouveauTour();
                    nb=Random().nextInt(themes.themes.length);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*3),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.white30),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                      Icon(Icons.arrow_forward_ios,color:Colors.white),
                      SizedBox(width: SizeConfig.safeBlockHorizontal*18,),
                      Text(
                        'Suivant!',
                        style: kButtonTextStyle,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
