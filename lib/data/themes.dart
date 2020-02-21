import 'package:jeu_des_themes/data/theme.dart';


//Ajouter des themes 50 pour l'instant.
//Dans la partie en mode gages (gages.dart) supprimer le theme en cours afin qu'il ne puisse plus apparaitre

class Themes{

  List<ThemeJeu> themes=[

    //Audiovisuel /6

    ThemeJeu('Les films de Steven Spielberg','Audiovisuel'),
    ThemeJeu('Les séries Netflix','Audiovisuel'),
    ThemeJeu('Les youtubeurs français à plus d\'1M d\'abonnés','Audiovisuel'),
    ThemeJeu('Les films français','Audiovisuel'),
    ThemeJeu('Les jeux télévisés','Audiovisuel'),
    ThemeJeu('Les animés japonais','Audiovisuel'),

    //Littérature /3

    ThemeJeu('Les oeuvres de Molière','Littérature'),
    ThemeJeu('Les romans-policiers','Littérature'),
    ThemeJeu('Les oeuvres de Molière','Littérature'),

    //Sport /8

    ThemeJeu('Les sports','Sport'),
    ThemeJeu('Les sportifs français','Sport'),
    ThemeJeu('Les champions du monde de foot \'98','Sport'),
    ThemeJeu('Les nageurs célèbres','Sport'),
    ThemeJeu('Les personnes ayant remportées le tour de France','Sport'),
    ThemeJeu('Les pilotes de Formule 1','Sport'),
    ThemeJeu('Les catcheurs de la WWE','Sport'),
    ThemeJeu('Les boxeurs célèbres','Sport'),

    //Hot /3

    ThemeJeu('Les actrices de cul','Hot'),
    ThemeJeu('Les crushs des gens dans la pièce','Hot'),
    ThemeJeu('Les positions sexuelles','Hot'),

    //Marques /6

    ThemeJeu('Les marques de voiture','Marques'),
    ThemeJeu('Les marques d\'eau','Marques'),
    ThemeJeu('Les enseignes de fast-food','Marques'),
    ThemeJeu('Les marques de vêtements','Marques'),
    ThemeJeu('Les marques de chaussures','Marques'),
    ThemeJeu('Les marques de téléphones','Marques'),

    //Géographie /7

    ThemeJeu('Les pays','Géographie'),
    ThemeJeu('Les fleuves','Géographie'),
    ThemeJeu('Les capitales','Géographie'),
    ThemeJeu('Les monuments','Géographie'),
    ThemeJeu('Les villes des Etats-Unis','Géographie'),
    ThemeJeu('Les pays d\'Europe','Géographie'),
    ThemeJeu('Les mers/océans','Géographie'),


    //Histoire /6

    ThemeJeu('Les guerres','Histoire'),
    ThemeJeu('Les présidents de la Vème république','Histoire'),
    ThemeJeu('Les inventions chinoises','Histoire'),
    ThemeJeu('Les inventions de Thomas Edison','Histoire'),
    ThemeJeu('Les présidents américains','Histoire'),
    ThemeJeu('Les dictateurs','Histoire'),

    //Musique /7

    ThemeJeu('Les types de musiques','Musique'),
    ThemeJeu('Les DJs','Musique'),
    ThemeJeu('Les compositeurs classiques','Musique'),
    ThemeJeu('Les titres de Rihanna','Musique'),
    ThemeJeu('Les titres de Justin Bieber','Musique'),
    ThemeJeu('Les rappeurs français','Musique'),
    ThemeJeu('Les rappeurs américains','Musique'),

    //Jeux-Video /4

    ThemeJeu('Les pokémons','Jeux'),
    ThemeJeu('Les personnages de League of Legends','Jeux'),
    ThemeJeu('Les jeux de tirs','Jeux'),
    ThemeJeu('Les jeux Mario','Jeux'),
  ];
  int nbTour;


  void initGame(){
    this.nbTour=1;
  }

  int getNbTour(){
    return this.nbTour;
}

  void nouveauTour(){
    this.nbTour++;
  }


}

