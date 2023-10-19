import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_kaarway_full/classes/Client.dart';
import 'package:my_kaarway_full/classes/Voiture.dart';

class ClientHasVoiture {
  int Client_idClient;
  int Voiture_Matricule;
  String Destination;
  int Prix;
  DateTime Date;
  String Type_Loc;

  Client? client;
  Voiture? voiture;

  ClientHasVoiture(
    this.Client_idClient,
    this.Voiture_Matricule,
    this.Destination,
    this.Prix,
    this.Date,
    this.Type_Loc,
  );
}
