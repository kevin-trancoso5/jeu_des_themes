import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeu_des_themes/data/constants.dart';
import 'package:jeu_des_themes/responsive/size_config.dart';
import 'package:jeu_des_themes/screens/game.dart';
import 'package:jeu_des_themes/screens/liste_joueurs.dart';
import 'package:jeu_des_themes/screens/regles.dart';

class Home extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical*2)
        ),
        backgroundColor: Colors.lightBlue[600],
        title: Text('Voulez-vous quitter l\'application?',style: TextStyle(color: Colors.white,fontFamily: 'Baloo',fontSize: SizeConfig.safeBlockVertical*2),),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Non',style: TextStyle(color: Colors.white,fontFamily: 'Baloo',fontSize: SizeConfig.safeBlockVertical*2.5),),
          ),
          FlatButton(
            onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: Text('Oui',style: TextStyle(color: Colors.white,fontFamily: 'Baloo',fontSize: SizeConfig.safeBlockVertical*2.5),),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                      SizedBox(height: SizeConfig.safeBlockVertical*18,),
                      Text('Bienvenue',
                          textAlign: TextAlign.center, style: kTitreTextStyle),
                      SizedBox(height: SizeConfig.safeBlockVertical*15,),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Game.id);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                              Icon(Icons.arrow_forward_ios,color:Colors.white),
                              SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                              Text('Partie normale!', style: kButtonTextStyle)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical*2,),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ListeJoueur.id);
                        },
                        child: Container(
                          padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                              Icon(Icons.arrow_forward_ios,color:Colors.white),
                              SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                              Text('Mode gage!', style: kButtonTextStyle,textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical*2,),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Regles.id);
                        },
                        child: Container(
                          padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                              Icon(Icons.arrow_forward_ios,color:Colors.white),
                              SizedBox(width: SizeConfig.safeBlockHorizontal*10,),
                              Text('Règles du jeu', style: kButtonTextStyle,textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );

  }
}
