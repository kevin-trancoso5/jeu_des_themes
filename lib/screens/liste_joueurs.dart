import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeu_des_themes/data/constants.dart';
import 'package:jeu_des_themes/data/joueur.dart';
import 'package:jeu_des_themes/responsive/size_config.dart';
import 'package:jeu_des_themes/screens/gage.dart';

class ListeJoueur extends StatefulWidget {
  static const String id = "liste_joueur_screen";

  @override
  _ListeJoueurState createState() => _ListeJoueurState();
}

class _ListeJoueurState extends State<ListeJoueur> {
  List<Joueur> joueurs = [];
  final TextEditingController tec = new TextEditingController();

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
                  colors: [Colors.deepPurple[900], Colors.lightBlue[900]]
                  //colors:[Color(0xFF61ACED),Color(0xFF84F5E4)]
                  )),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'Liste des joueurs:',
                  style: kListeJoueurTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text(
                  '(Restez appuyé sur un joueur pour le retirer)',
                  style: kPetitTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext ctxt, int index) {
                    return FlatButton(
                      onPressed: () {},
                        onLongPress: () {
                          setState(() {
                            joueurs.remove(joueurs[index]);
                          });
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue[700],
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.safeBlockVertical * 10)),
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockVertical * 2,
                                  right: SizeConfig.safeBlockVertical * 2,
                                  top: SizeConfig.safeBlockVertical * 1,
                                  bottom: SizeConfig.safeBlockVertical * 1),
                              child: Text(joueurs[index].nom,
                                  style: kThemeTextStyle,textAlign: TextAlign.center,)),
                        ));
                  },
                  itemCount: joueurs.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 2),
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
                  decoration: BoxDecoration(color: Colors.lightBlue[800]),
                  child: TextField(
                    style:
                        TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6),
                    decoration: InputDecoration(hintText: 'Ajouter un joueur'),
                    textAlign: TextAlign.center,
                    controller: tec,
                    onSubmitted: (text) {
                      joueurs.add(Joueur(text));
                      tec.clear();
                      setState(() {});
                    },
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){
                  if (joueurs.length<2){
                    Fluttertoast.cancel();
                    Fluttertoast.showToast(        msg: "Minimum 2 joueurs.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                  else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Gage(joueurs: joueurs)));
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 18,
                      ),
                      Text(
                        'Suivant!',
                        style: kButtonTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical*5,)
            ],
          ),
        )));
  }
}
