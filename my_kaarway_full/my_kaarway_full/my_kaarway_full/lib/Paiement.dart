import 'package:flutter/material.dart';

class PaiementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choisissez un mode de paiement',
          style: TextStyle(color: Colors.white), // Couleur du texte en blanc
        ),
        backgroundColor: Colors.black, // Fond de l'appBar en noir
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Retour à la page précédente (page d'accueil)
          },
        ),
      ),
      body: Stack(
        children: [
          // Image en arrière-plan
          Image.asset(
            'assets/white.png',
            width: double.infinity, // Largeur de l'image étendue à l'écran
            height: double.infinity, // Hauteur de l'image étendue à l'écran
            fit: BoxFit.cover, // Remplir tout l'espace disponible
          ),
          GridView.count(
            crossAxisCount: 2, // 2 colonnes
            children: [
              buildPaymentCard(
                'assets/master_card.png',
                'MasterCard',
              ),
              buildPaymentCard(
                'assets/orangemoney_logo.png',
                'Orange Money',
              ),
              buildPaymentCard(
                'assets/wave_logo.png',
                'Wave',
              ),
              buildPaymentCard(
                'assets/freemoney-logo.png',
                'Free Money',
              ),
              buildPaymentCard(
                'assets/paypal_logo.png',
                'PayPal',
              ),
              buildPaymentCard(
                'assets/kpay_logo.png',
                'Kpay',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentCard(String imagePath, String title) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          // Gérer l'action de paiement ici
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 64, // Largeur de l'image
              height: 64, // Hauteur de l'image
            ),
            SizedBox(height: 8.0), // Espacement entre l'image et le texte
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
