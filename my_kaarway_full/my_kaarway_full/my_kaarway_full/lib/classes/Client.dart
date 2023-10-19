import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Client {
  int? idClient;
  String Nom;
  String Prenom;
  String Tel;
  String Email;
  String Password;
  int? Location_idLocation;

  Client(
    this.idClient,
    this.Nom,
    this.Prenom,
    this.Tel,
    this.Email,
    this.Password,
    this.Location_idLocation,
  );

  
}
