import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  final double soldeBaobabPay; // Le solde du wallet

  WalletPage({required this.soldeBaobabPay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7033FF),
        title: Text('Mon Wallet'),
      ),
      body: ListView(
        children: [
          // Première section : Affichage du solde
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color(0xFF7033FF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF7033FF), // Couleur de la bulle
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      '\$$soldeBaobabPay', // Affiche le montant restant
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
          // Deuxième section : Boutons de recharge
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                buildRechargeCard('Master Card', '', 'assets/master_card.png'),
                buildRechargeCard(
                    'Orange Money', '', 'assets/orangemoney_logo.png'),
                buildRechargeCard('Wave', '', 'assets/wave_logo.png'),
                buildRechargeCard(
                    'Free Money', '', 'assets/freemoney-logo.png'),
                buildRechargeCard('Paypal', '', 'assets/paypal_logo.png'),
                buildRechargeCard('Kpay', '', 'assets/kpay_logo.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRechargeCard(String title, String amount, String imagePath) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Gérer l'action de recharge ici
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
