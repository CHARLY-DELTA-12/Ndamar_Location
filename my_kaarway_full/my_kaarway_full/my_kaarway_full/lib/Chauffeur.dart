import 'package:flutter/material.dart';

class InscriptionChauffeurPage extends StatefulWidget {
  const InscriptionChauffeurPage({Key? key}) : super(key: key);

  @override
  _InscriptionChauffeurPageState createState() =>
      _InscriptionChauffeurPageState();
}

class _InscriptionChauffeurPageState extends State<InscriptionChauffeurPage> {
  bool _accepteConditions = false;
  String _indicatifPays = "+221"; // Indicatif du Sénégal par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Fond blanc de l'AppBar
        iconTheme: IconThemeData(
            color: Colors.black), // Icônes en noir (bouton de retour)
        title: Text(
          'Inscription Chauffeur',
          style: TextStyle(color: Colors.black), // Titre en noir
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/white.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80.0),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF5202CF),
                  ),
                  child: Icon(
                    Icons.directions_car,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Inscription Chauffeur',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5202CF),
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF5202CF),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF5202CF),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        _indicatifPays,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Numéro de téléphone',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF5202CF),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF5202CF),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF5202CF),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Marque de la Voiture',
                    prefixIcon: Icon(
                      Icons.car_crash_rounded,
                      color: Color(0xFF5202CF),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Matricule',
                    prefixIcon: Icon(
                      Icons.confirmation_num,
                      color: Color(0xFF5202CF),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF5202CF),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF5202CF),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _accepteConditions,
                      onChanged: (newValue) {
                        setState(() {
                          _accepteConditions = newValue!;
                        });
                      },
                    ),
                    Flexible(
                      child: Text(
                        "En vous inscrivant, vous acceptez nos Conditions générales, notre Politique de confidentialité et notre Politique d’utilisation des cookies.",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF5202CF),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _accepteConditions
                      ? () {
                          // Gérer l'inscription ici
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 32.0,
                    ),
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5202CF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InscriptionChauffeurPage(),
  ));
}
