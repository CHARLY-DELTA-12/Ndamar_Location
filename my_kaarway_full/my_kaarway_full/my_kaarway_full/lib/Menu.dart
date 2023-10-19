import 'package:flutter/material.dart';
import 'package:my_kaarway_full/connection.dart';
import 'package:my_kaarway_full/connectionchauffeur.dart';
import 'Paiement.dart';
import 'ServiceClient.dart';
import 'Historique.dart';
import 'package:my_kaarway_full/GooglemapPage.dart';

class MenuWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ndamar_Location.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.app_registration, color: Color(0xFF7033FF)),
            title: Text(
              'Connexion',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConnectionPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFF7033FF)),
            title: Text(
              'Devenir Chauffeur',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConnectionChauffeurPage(),
                ),
              );
            },
          ),
          // Ajoutez la section "Louer une voiture" ici
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Color(0xFF7033FF),
            ),
            title: Text(
              'Mode de Paiement',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaiementPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.map,
              color: Color(0xFF7033FF),
            ),
            title: Text(
              'Service de Covoiturage',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month,
              color: Color(0xFF7033FF),
            ),
            title: Text(
              'Historiques de location',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoriquePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Color(0xFFF34848)),
            title: Text(
              'Service Client',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceClientPage(),
                ),
              );
            },
          ),
          Container(
            height: 265.0, // Hauteur du conteneur pour le texte de copyright
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  '© 2023 Baobab Location. Tous droits réservés.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
