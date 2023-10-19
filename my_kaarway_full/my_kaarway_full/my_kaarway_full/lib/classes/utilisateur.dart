import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Utilisateur {
  int idutilisateur;
  String nom;
  String prenom;
  String email;
  int telephone;
  String password;
  String profile;

  Utilisateur(
    this.idutilisateur,
    this.nom,
    this.prenom,
    this.email,
    this.telephone,
    this.password,
    this.profile,
  );
}
