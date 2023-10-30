import 'package:flutter/material.dart';

String uri = 'https://kamalshopapp.onrender.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://img.freepik.com/free-photo/arrangement-antiques-market-objects_23-2148950910.jpg?w=996&t=st=1698425898~exp=1698426498~hmac=26bc764cc24876d2bae225ce66c35bc7cd47f1b9c8711cad9db2a8be690fa52d',
    'https://img.freepik.com/free-photo/plates-market-morocco_23-2148129785.jpg?w=996&t=st=1698425959~exp=1698426559~hmac=671dcc918e8cb7b14f4a57696551dd4f36eff1ed8165a9a7e41724a6986b70d8',
    'https://img.freepik.com/free-photo/side-view-traditional-rug-being-woven-carpet-vertical-loom-oriental-wall_140725-12867.jpg?w=900&t=st=1698426322~exp=1698426922~hmac=167940202c10b2ffc3264686aa42c65bb95b419ac9006cee67eb9414ff6284e3',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Produits Halfa',
    },
    {
      'title': 'Couffin & Chapeau',
    },
    {
      'title': 'Margoum',
    },
    {
      'title': 'Divers',
    },
    {
      'title': 'Fashion',
    },
  ];
}
