import 'package:flutter/material.dart';
import 'car_details.dart';

void main() {
  runApp(MaterialApp(
    home: LouerVoiturePage(),
  ));
}

class LouerVoiturePage extends StatefulWidget {
  @override
  _LouerVoiturePageState createState() => _LouerVoiturePageState();
}

class _LouerVoiturePageState extends State<LouerVoiturePage> {
  String selectedCarType = 'Type 1';

  List<Map<String, dynamic>> carCategories = [
    {'name': 'Mercedes CLA', 'image': 'assets/sedan.png'},
    {'name': 'BMW M2', 'image': 'assets/coupe.png'},
    {'name': 'KIA Sorento', 'image': 'assets/SUV.png'},
    {'name': 'Nissan GTR', 'image': 'assets/sport.png'},
    {'name': 'KIA Sportage', 'image': 'assets/sportage.png'},
    {'name': 'Citroen Cactus', 'image': 'assets/cactus.png'},
    {'name': 'Dodge Challenger', 'image': 'assets/challenger.png'},
    {'name': 'Hundai Elantra', 'image': 'assets/elantra.png'},
    {'name': 'Chevrolet Equinox', 'image': 'assets/equinox.png'},
    {'name': 'Escallade', 'image': 'assets/escallade.png'},
    {'name': 'Ford Escape', 'image': 'assets/escape.png'},
    {'name': 'Ford Fusion', 'image': 'assets/fusion.png'},
    {'name': 'Misubitshi Lancer', 'image': 'assets/lancer.png'},
    {'name': 'Kia Optima', 'image': 'assets/optima.png'},
    {'name': 'Toyota Prado', 'image': 'assets/prado.png'},
    {'name': 'Range Rover Evoque', 'image': 'assets/rangerover.png'},
    {'name': 'Citroen DS4', 'image': 'assets/ds4.png'},
    {'name': 'Dacia Duster', 'image': 'assets/duster.png'},
    {'name': 'Citroen C4', 'image': 'assets/c4.png'},
    {'name': 'Peugeot 3008', 'image': 'assets/3008.png'},
    // Ajoutez les autres catégories ici...
  ];

  List<Map<String, dynamic>> carsInCategory = [
    {
      'name': 'Mercedes CLA',
      'image': 'assets/sedan.png',
      'seats': '2 places',
      'kilometers': '10 000 km',
      'rentAmount': '40.000 FCFA/jours',
    },
    {
      'name': 'BMW M2',
      'image': 'assets/coupe.png',
      'seats': '4 places',
      'kilometers': '8 000 km',
      'rentAmount': '45.000 FCFA/jours',
    },
    {
      'name': 'KIA Sorento',
      'image': 'assets/SUV.png',
      'seats': '7 places',
      'kilometers': '15 000 km',
      'rentAmount': '30.000 FCFA/jours',
    },
    {
      'name': 'NISSAN GTR',
      'image': 'assets/sport.png',
      'seats': '5 places',
      'kilometers': '12 000 km',
      'rentAmount': '70.000 FCFA/jours',
    },
    {
      'name': 'KIA Sportage',
      'image': 'assets/sportage.png',
      'seats': '5 places',
      'kilometers': '9 500 km',
      'rentAmount': '40.000 FCFA/jours',
    },
    {
      'name': 'Citroen Cactus',
      'image': 'assets/cactus.png',
      'seats': '4 places',
      'kilometers': '9 500 km',
      'rentAmount': '35.000 FCFA/jours',
    },
    {
      'name': 'Dogde Challenger',
      'image': 'assets/challenger.png',
      'seats': '2 places',
      'kilometers': '11 500 km',
      'rentAmount': '65.000 FCFA/jours',
    },
    {
      'name': 'Hundai Elantra',
      'image': 'assets/elantra.png',
      'seats': '4 places',
      'kilometers': '8 800 km',
      'rentAmount': '35.000 FCFA/jours',
    },
    {
      'name': 'Chevrolet Equinox ',
      'image': 'assets/equinox.png',
      'seats': '5 places',
      'kilometers': '16 000 km',
      'rentAmount': '45.000 FCFA/jours',
    },
    {
      'name': 'Cadillac Escallade',
      'image': 'assets/escallade.jours',
      'seats': '5 places',
      'kilometers': '10 200 km',
      'rentAmount': '75.000 FCFA/jours',
    },
    {
      'name': 'Ford Escape',
      'image': 'assets/escape.png',
      'seats': '4 places',
      'kilometers': '8 300 km',
      'rentAmount': '40.000 FCFA/jours',
    },
    {
      'name': 'Ford Fusion',
      'image': 'assets/fusion.png',
      'seats': '7 places',
      'kilometers': '14 800 km',
      'rentAmount': '35.000 FCFA/jours',
    },
    {
      'name': 'Mitsubitshi Lancer ',
      'image': 'assets/lancer.png',
      'seats': '2 places',
      'kilometers': '11 000 km',
      'rentAmount': '60.000 FCFA/jours',
    },
    {
      'name': 'KIA Optima',
      'image': 'assets/optima.png',
      'seats': '5 places',
      'kilometers': '9 200 km',
      'rentAmount': '35.000 FCFA/jours',
    },
    {
      'name': 'Toyota Prado',
      'image': 'assets/prado.png',
      'seats': '5 places',
      'kilometers': '5 500 km',
      'rentAmount': '40.000 FCFA/day',
    },
    {
      'name': 'Range Rover Evoque',
      'image': 'assets/rangerover.png',
      'seats': '5 places',
      'kilometers': '5 000 km',
      'rentAmount': '60.000 FCFA/jours',
    },
    {
      'name': 'Citroen DS4',
      'image': 'assets/ds4.png',
      'seats': '4 places',
      'kilometers': '8 600 km',
      'rentAmount': '45.000 FCFA/jours',
    },
    {
      'name': 'Dacia Duster',
      'image': 'assets/duster.png',
      'seats': '5 places',
      'kilometers': '6 200 km',
      'rentAmount': '50.000 FCFA/jours',
    },
    {
      'name': 'Citroen C4',
      'image': 'assets/c4.png',
      'seats': '5 places',
      'kilometers': '8 000 km',
      'rentAmount': '50.000 FCFA/jours',
    },
    {
      'name': 'Peugeot 3008',
      'image': 'assets/3008.png',
      'seats': '4 places',
      'kilometers': '8 900 km',
      'rentAmount': '30.000 FCFA/jours',
    },
    // Ajoutez les détails des autres catégories ici...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/white.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Sélectionnez une voiture :',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: carCategories.length,
                  itemBuilder: (context, index) {
                    final category = carCategories[
                        index]; // Définissez 'category' à cet endroit.
                    final carDetails = carsInCategory.firstWhere(
                      (car) => car['name'] == category['name'],
                      orElse: () => {
                        'name': 'N/A',
                        'image': 'N/A',
                        'seats': 'N/A',
                        'kilometers': 'N/A',
                        'rentAmount': 'N/A',
                      },
                    );

                    if (carDetails == null) {
                      // Gérez le cas où aucun détail de voiture n'est trouvé pour cette catégorie.
                      // Vous pouvez afficher un message d'erreur ou prendre une autre action appropriée.
                      return SizedBox
                          .shrink(); // Cela permet de masquer la carte si aucun détail n'est trouvé.
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCarType = category['name'];
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailsPage(
                              carDetails: carDetails,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              category['image'],
                              width: 96.0,
                              height: 96.0,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              category['name'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.people, color: Colors.black),
                                Text(carDetails['seats'],
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.speed, color: Colors.black),
                                Text(carDetails['kilometers'],
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.attach_money, color: Colors.black),
                                Text(carDetails['rentAmount'],
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
