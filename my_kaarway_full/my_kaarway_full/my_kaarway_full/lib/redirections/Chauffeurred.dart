import 'package:flutter/material.dart';
import 'package:my_kaarway_full/main.dart';
class ChauffeurRedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord du chauffeur'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Icône de déconnexion
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
              'Tableau de bord du chauffeur',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Affichez la liste des commandes et les boutons d'acceptation/refus ici
            // Par exemple, utilisez une ListView pour afficher les commandes
            // avec des boutons d'acceptation et de refus.
            // Voici un exemple simplifié :
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Client 1 - Commande en attente'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Accepter la commande du client 1
                          },
                          child: Text('Accepter'),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Refuser la commande du client 1
                          },
                          child: Text('Refuser'),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Client 2 - Commande en attente'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Accepter la commande du client 2
                          },
                          child: Text('Accepter'),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Refuser la commande du client 2
                          },
                          child: Text('Refuser'),
                        ),
                      ],
                    ),
                  ),
                  // Ajoutez d'autres éléments de la liste ici
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
