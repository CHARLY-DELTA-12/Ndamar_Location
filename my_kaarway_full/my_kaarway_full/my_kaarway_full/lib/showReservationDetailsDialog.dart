import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Remplacez les informations de la voiture et les dates selon vos besoins.
            final carDetails = {
              'name': 'Car Model',
              'seats': '4',
              'kilometers': '1000',
              'rentAmount': '50',
            };
            final startDate = DateTime.now();
            final endDate = DateTime.now().add(Duration(days: 3));
            final totalAmount = 150;
            final chauffeurOption = false;

            await showReservationDetailsDialog(
              context,
              carDetails,
              startDate,
              endDate,
              totalAmount,
              chauffeurOption,
            );
          },
          child: Text('Afficher le dialogue'),
        ),
      ),
    );
  }
}

Future<void> showReservationDetailsDialog(
  BuildContext context,
  Map<String, dynamic> carDetails,
  DateTime startDate,
  DateTime endDate,
  int totalAmount,
  bool chauffeurOption,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Center(
          child: pw.Container(
            padding: pw.EdgeInsets.all(10.0),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                width: 2.0,
                color: PdfColors.black,
              ),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Détails de la réservation',
                    style: pw.TextStyle(fontSize: 20)),
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Text('Voiture: ${carDetails['name']}'),
                pw.Text('Nombre de places: ${carDetails['seats']}'),
                pw.Text('Kilométrage: ${carDetails['kilometers']}'),
                pw.Text(
                    'Prix de location par jour: ${carDetails['rentAmount']}'),
                pw.Text(
                    'Date de début: ${startDate.toLocal().toString().split(' ')[0]}'),
                pw.Text(
                    'Date de fin: ${endDate.toLocal().toString().split(' ')[0]}'),
                pw.Text('Montant Total : \$$totalAmount'),
                if (chauffeurOption) pw.Text('Avec Chauffeur'),
                pw.BarcodeWidget(
                  barcode: pw.Barcode.qrCode(),
                  data: 'Code-barres de la réservation',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );

  try {
    final pdfData = await pdf.save();

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;

    final pdfFile = File('$appDocPath/reservation_details.pdf');
    await pdfFile.writeAsBytes(pdfData);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Détails de la réservation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Voiture: ${carDetails['name']}'),
              Text('Nombre de places: ${carDetails['seats']}'),
              Text('Kilométrage: ${carDetails['kilometers']}'),
              Text('Prix de location par jour: ${carDetails['rentAmount']}'),
              Text(
                  'Date de début: ${startDate.toLocal().toString().split(' ')[0]}'),
              Text(
                  'Date de fin: ${endDate.toLocal().toString().split(' ')[0]}'),
              Text('Montant Total : \$$totalAmount'),
              if (chauffeurOption) Text('Avec Chauffeur'),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  final filePath = '$appDocPath/reservation_details.pdf';
                  final result = await OpenFile.open(filePath);
                  if (result.type != ResultType.done) {
                    // Gérer les erreurs ici si l'ouverture du fichier échoue.
                  }
                },
                child: Text('Télécharger comme PDF'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  } catch (e) {
    print("Erreur lors de la génération du PDF : $e");
  }
}
