import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceClientPage extends StatelessWidget {
  const ServiceClientPage({Key? key});

  void _launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'ouvrir l\'application de numérotation du téléphone.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Service Client',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white, // Couleur de l'AppBar en blanc
        iconTheme:
            IconThemeData(color: Colors.black), // Couleur de l'icône en noir
        actionsIconTheme: IconThemeData(
            color: Colors.black), // Couleur de l'icône de l'action en noir
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/white.png'), // Remplacez 'your_background_image.jpg' par le chemin de votre image d'arrière-plan
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Service Client',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Couleur du texte en noir
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Si vous avez des questions ou des problèmes, veuillez nous contacter au numéro de service client ci-dessous :',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black, // Couleur du texte en noir
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Numéro de Service Client : +222 77 307 77 54',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Couleur du texte en noir
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  _launchPhone(
                      '+221773077754'); // Ouvre l'application de numérotation
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xFF7033FF)), // Couleur du bouton
                ),
                child: Text(
                  "Contacter le Service Client",
                  style: TextStyle(
                    fontSize: 20.0, // Taille du texte augmentée
                    color: Colors.white, // Couleur du texte en blanc
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

void main() {
  runApp(MaterialApp(
    home: ServiceClientPage(),
  ));
}
