import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Admin {
  int idAdmin;
  String Nom;
  String Prenom;
  String email;
  int Client_idClient;

  Client client;
  List<Chauffeur> chauffeurs;
  List<Voiture> voitures;

  Admin(
    this.idAdmin,
    this.Nom,
    this.Prenom,
    this.email,
    this.Client_idClient,
    this.client,
    this.chauffeurs,
    this.voitures,
  );
}

class Client {
  // Client class implementation
}

class Chauffeur {
  // Chauffeur class implementation
}

class Voiture {
  // Voiture class implementation
}
