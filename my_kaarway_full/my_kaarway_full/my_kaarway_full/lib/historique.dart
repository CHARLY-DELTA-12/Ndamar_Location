import 'package:flutter/material.dart';

class HistoriquePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historique des Activités',
          style: TextStyle(
            color: Colors.black, // Couleur du texte en noir
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Bouton de retour en noir
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white, // Couleur de l'AppBar en blanc
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: HistoryList(),
    );
  }
}

class HistoryList extends StatelessWidget {
  final List<String> historyItems = [
    'Événement 1 - 15 Janvier 2023',
    'Événement 2 - 20 Février 2023',
    'Événement 3 - 25 Mars 2023',
    'Événement 4 - 30 Avril 2023',
    'Événement 5 - 5 Mai 2023',
    'Événement 6 - 10 Juin 2023',
    'Événement 7 - 10 Juin 2023',
    'Événement 8 - 10 Juin 2023',
    'Événement 9 - 10 Juin 2023',
    'Événement 10 - 10 Juin 2023',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2, // Ombre légère pour le Card
          margin: EdgeInsets.all(8.0), // Marge autour du Card
          child: ListTile(
            title: Text(
              historyItems[index],
              style: TextStyle(
                fontSize: 16.0, // Taille de la police
                color: Colors.black, // Couleur du texte en noir
              ),
            ),
            trailing: Icon(
              Icons
                  .arrow_forward, // Icône pour indiquer un détail ou une action
              color: Colors.black, // Couleur de l'icône en noir
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HistoriquePage(),
  ));
}
