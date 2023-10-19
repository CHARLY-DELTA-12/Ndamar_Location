import 'package:flutter/material.dart';
import 'main.dart'; // Importez la page d'accueil ici

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ),
      // Utilisez EnterPage comme page d'accueil
      home: EnterPage(),
    );
  }
}

class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/your_logo.png', // Remplacez 'your_logo.png' par le chemin de votre image de logo
              width: 200.0, // Réglez la largeur de l'image selon vos besoins
              height: 200.0, // Réglez la hauteur de l'image selon vos besoins
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Naviguez vers la page d'accueil lorsque le bouton est appuyé
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                'Suivant',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5202CF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
