import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Chauffeur {
  int? idChauffeur;
  String Nom;
  String Prenom;
  String Marque_voiture;
  String Matricule;
  int? Admin_idAdmin;

  Chauffeur(
    this.idChauffeur,
    this.Nom,
    this.Prenom,
    this.Marque_voiture,
    this.Matricule,
    this.Admin_idAdmin,
  );
}
