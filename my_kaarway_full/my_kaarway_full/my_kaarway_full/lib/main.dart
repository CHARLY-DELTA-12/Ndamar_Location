import 'package:flutter/material.dart';
import 'package:my_kaarway_full/Menu.dart';
import 'WalletPage.dart'; // Importez cette page
import 'package:my_kaarway_full/redirections/Clientred.dart';
import 'package:my_kaarway_full/Admin.dart';
import 'package:my_kaarway_full/LouerVoiture.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/welcomeclient': (context) => ClientRedPage(
            username: '',
          ),
      '/adminhomepage': (context) => AdminDashboard(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndamar Location',
      theme: ThemeData(
        primaryColor: Color(0xFF7033FF),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ),
      home: EnterPage(),
    );
  }
}

class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/NL-1.png',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 40.0,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 50.0), // Espace supplémentaire en haut
                  Text(
                    "Découvrez une nouvelle façon de voyager avec notre application de location de voitures. Bienvenue à bord !",
                    style: TextStyle(
                      fontSize: 25.0, // Augmentez la taille du texte ici
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF34848),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Réduisez la bordure du bouton
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0, // Réduisez la taille du bouton ici
                        horizontal: 32.0,
                      ),
                    ),
                    child: Text(
                      'Suivant',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final double soldeBaobabPay = 1000.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7033FF),
        title: Text('Ndamar Location'),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.account_balance_wallet),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WalletPage(soldeBaobabPay: soldeBaobabPay),
                    ),
                  );
                },
                padding: EdgeInsets.only(left: 50.0),
              ),
              Stack(
                children: [
                  Icon(
                    Icons.add_circle_outline, // Icône du petit plus
                    size: 24.0,
                    color: Colors.blue, // Couleur de l'icône
                  ),
                  Positioned(
                    right: 0, // Ajuste la position à droite
                    top: 0, // Ajuste la position en haut
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Colors.red, // Couleur de l'arrière-plan de la bulle
                      ),
                      constraints: BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                      child: Center(
                        child: Text(
                          '10.000 FCFA', // Montant disponible sur le wallet (à remplacer par la valeur réelle)
                          style: TextStyle(
                            color: Colors.white, // Couleur du texte
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      drawer: MenuWidget1(),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: LouerVoiturePage(), // Utilisez la classe MapboxMapPage ici
            // Utilisez la classe MapboxMapPage ici
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color:
                    Colors.white.withOpacity(0.7), // Arrière-plan transparent
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              /* child: MapboxAutoCompleteTextField(
                apiKey:
                    'pk.eyJ1IjoibG9saXBvcDIwIiwiYSI6ImNsbjVieXkxODA3enkycXQ3eG0yc3k1dDUifQ.CysBYG3F0w9KUXXoYioyxw',
                hint: 'Rechercher une destination',
                onSelected: (place) {
                  // Traitez le lieu sélectionné ici
                  print(place.placeName);
                },
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
