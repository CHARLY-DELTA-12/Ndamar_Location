import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              // Ajoutez votre en-tête ici
              ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Tableau de bord'),
            onTap: () {
              // Redirigez vers le tableau de bord ici
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Liste des clients'),
            onTap: () {
              // Redirigez vers la liste des clients ici
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_eta),
            title: Text('Liste des chauffeurs'),
            onTap: () {
              // Redirigez vers la liste des chauffeurs ici
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text('Déconnexion'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<String> pendingBookings = [
    'Réservation 1',
    'Réservation 2',
    // ...
  ];

  List<String> clients = [];
  List<String> drivers = [];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Charger les données des clients et des chauffeurs lorsque le widget est créé
    loadClients();
    loadDrivers();
  }

  Future<void> loadClients() async {
    final response =
        await http.get(Uri.parse('http://192.168.5.95:8000/api/clients'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      final List<String> clientNames =
          list.map((model) => model['nom'].toString()).toList();
      setState(() {
        clients = clientNames;
      });
    } else {
      throw Exception('Échec de la récupération des clients');
    }
  }

  Future<void> loadDrivers() async {
    final response =
        await http.get(Uri.parse('http://192.168.5.95:8000/api/chauffeurs'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      final List<String> driverNames =
          list.map((model) => model['nom'].toString()).toList();
      setState(() {
        drivers = driverNames;
      });
    } else {
      throw Exception('Échec de la récupération des chauffeurs');
    }
  }

  Widget _buildCurrentTab() {
    if (_currentIndex == 0) {
      return _buildBookingList();
    } else if (_currentIndex == 1) {
      return _buildClientsList();
    } else if (_currentIndex == 2) {
      return _buildDriversList();
    }
    return Container();
  }

  Widget _buildBookingList() {
    return ListView.builder(
      itemCount: pendingBookings.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(pendingBookings[index]),
          trailing: ElevatedButton(
            onPressed: () {
              // Confirmer la location ici
              confirmBooking(index);
            },
            child: Text('Confirmer'),
          ),
        );
      },
    );
  }

  Widget _buildClientsList() {
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(clients[index]),
        );
      },
    );
  }

  Widget _buildDriversList() {
    return ListView.builder(
      itemCount: drivers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(drivers[index]),
        );
      },
    );
  }

  void confirmBooking(int index) {
    // Mettez ici votre logique de confirmation de la location.
    // Vous pouvez par exemple supprimer la réservation de la liste des réservations en attente.
    setState(() {
      pendingBookings.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tableau de Bord Administrateur'),
          backgroundColor: Color(0xFF7033FF),
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white, // Couleur du texte en blanc
            ),
          ).bodyText2,
        ),
        body: _buildCurrentTab(),
        drawer: MenuWidget(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminDashboard(),
  ));
}
