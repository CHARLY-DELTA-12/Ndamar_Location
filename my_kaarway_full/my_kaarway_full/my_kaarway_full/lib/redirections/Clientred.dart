import 'package:flutter/material.dart';
import 'package:my_kaarway_full/main.dart';
class ClientRedPage extends StatelessWidget {
  final String username;

  ClientRedPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue, $username'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page d\'accueil après connexion',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Vous pouvez ajouter d'autres éléments à votre page d'accueil ici
          ],
        ),
      ),
    );
  }
}
