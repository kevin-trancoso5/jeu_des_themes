import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeu_des_themes/data/gages.dart';
import 'package:jeu_des_themes/data/joueur.dart';
import 'package:jeu_des_themes/data/themes.dart';
import 'package:jeu_des_themes/responsive/size_config.dart';
import 'package:jeu_des_themes/data/constants.dart';
import 'package:jeu_des_themes/screens/home.dart';



class Gage extends StatefulWidget {
  static const String id = 'gage_screen';

  final List<Joueur> joueurs;

  Gage({this.joueurs});
  @override
  _GageState createState() {
    return _GageState(joueurs: joueurs);
  }
}

class _GageState extends State<Gage> {
  String lesPerdants ='';
  Themes themes = Themes();
  Gages gages = Gages();
  final List<Joueur> joueurs;
  int nb;
  int gagenb;

  _GageState({this.joueurs});
  @override
  void initState() {
    themes.initGame();

    nb = Random().nextInt(themes.themes.length);
    super.initState();
  }

  void getPerdantsToString(){
    joueurs.sort((a,b)=> a.points.compareTo(b.points));
    int scoreABattre=joueurs[joueurs.length-1].points;

    for (int i=0; i<joueurs.length;i++){
      if(joueurs[i].points<scoreABattre){
        joueurs.removeAt(i);
        i--;
      }
    }

    for (int j = 0; j<joueurs.length;j++){
      lesPerdants+='- ${joueurs[j].nom}\n';
    }
    setState(() {
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical*2)
        ),
        backgroundColor: Colors.lightBlue[600],
        title: Text('Voulez-vous quitter?',style: TextStyle(color: Colors.white,fontFamily: 'Baloo',fontSize: SizeConfig.safeBlockVertical*2.5),),
        actions: <Widget>[
           FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Non',style: TextStyle(color: Colors.white,fontFamily: 'Baloo',fontSize: SizeConfig.safeBlockVertical*2.5),),
          ),
           FlatButton(
            onPressed: () => Navigator.pushNamed(context, Home.id),
            child: Text('Oui',style: TextStyle(color: Colors.white,fontFamily: 'Baloo',fontSize: SizeConfig.safeBlockVertical*2.5),),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.deepPurple[900],
          body: SafeArea(
              child: themes.getNbTour() <= 10
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.deepPurple[900],
                            Colors.lightBlue[900]
                          ]
                              //colors:[Color(0xFF61ACED),Color(0xFF84F5E4)]
                              )),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          Text(
                            'Tour n°${themes.getNbTour().toString()}',
                            style: kTourTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            themes.themes[nb].categorie,
                            style: kCategorieTextStyle,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          Text(
                            themes.themes[nb].nom,
                            style: kThemeTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                SizeConfig.safeBlockHorizontal * 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 10,
                                ),
                                Icon(Icons.arrow_downward, color: Colors.white),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 4,
                                ),
                                Text(
                                  'Cliquez sur le perdant!',
                                  style: kButtonTextStyle,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (BuildContext ctxt, int index) {
                                return Player(
                                  joueurs: joueurs,
                                  index: index,
                                  onPress: () {
                                    setState(() {
                                      joueurs[index].ajoutPoint();
                                      themes.nouveauTour();
                                      nb = Random().nextInt(themes.themes.length);
                                      if (themes.getNbTour()==11){
                                        getPerdantsToString();
                                        gagenb = Random().nextInt(gages.gages.length);
                                      }
                                    });
                                  },
                                );
                              },
                              itemCount: joueurs != null ? joueurs.length : 0,
                            ),
                          ),
                        ],
                      ))
                  : Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.deepPurple[900],
                            Colors.lightBlue[900]
                          ]
                              //colors:[Color(0xFF61ACED),Color(0xFF84F5E4)]
                              )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          Text(
                            'Le(s) perdant(s)',
                            style: kTourTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            lesPerdants,
                            style: kCategorieTextStyle,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          Text(
                            gages.gages[gagenb],
                            style: kThemeTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                joueurs.clear();
                                themes.initGame();
                                Navigator.pushNamed(context, Home.id);
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
                                  SizedBox(width: SizeConfig.safeBlockHorizontal*8,),
                                  Text(
                                    'Fin de la partie!',
                                    style: kButtonTextStyle,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))),
    );
  }
}

class Player extends StatelessWidget {
  Player({this.joueurs, this.index, this.onPress});

  final List<Joueur> joueurs;
  final int index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 0.5),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue[700],
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockVertical * 3)),
            padding: EdgeInsets.only(
                left: SizeConfig.safeBlockVertical * 3,
                right: SizeConfig.safeBlockVertical * 3,
                top: SizeConfig.safeBlockVertical * 1,
                bottom: SizeConfig.safeBlockVertical * 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  joueurs[index].nom,
                  style: kThemeTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  joueurs[index].points.toString(),
                  style: kThemeTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
