import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:my_kaarway_full/classes/admin.dart';

class Voiture {
  int Matricule;
  String Marque_voiture;
  DateTime Annee_de_fabrication;
  int? Chauffeur_idChauffeur;
  String Etat;
  int? Admin_idAdmin;

  Admin admin;
  Chauffeur? chauffeur;
  List<Client> clients;

  Voiture({
    required this.Matricule,
    required this.Marque_voiture,
    required this.Annee_de_fabrication,
    required this.Chauffeur_idChauffeur,
    required this.Etat,
    required this.Admin_idAdmin,
    required this.admin,
    required this.chauffeur,
    required this.clients,
  });
}
