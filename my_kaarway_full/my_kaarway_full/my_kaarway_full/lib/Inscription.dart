import 'package:flutter/material.dart';
import 'package:my_kaarway_full/classes/wsManager.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  bool _accepteConditions = false;
  String _indicatifPays = "+221";
  // Indicatif du Sénégal par défaut
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  WsManager wsManager = WsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Fond blanc de l'AppBar
        iconTheme: IconThemeData(color: Colors.black), // Icônes en noir
        title: Text(
          'Ndamaar Location',
          style: TextStyle(
            color: Colors.black, // Titre en noir
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Bouton de retour en noir
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/white.png'), // Remplacez par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                  color: Color(0xFF7033FF),
                ),
                child: Icon(
                  Icons.directions_car,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Inscription',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7033FF),
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 32.0),
              TextFormField(
                controller: _prenomController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF7033FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF7033FF),
                  ),
                  border: OutlineInputBorder(
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
                      controller: _telController,
                      decoration: InputDecoration(
                        labelText: 'Numéro de téléphone',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xFF7033FF),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF7033FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF7033FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 16.0,
              ),
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
                        color: Color(0xFF7033FF),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
                onPressed: _accepteConditions
                    ? () async {
                        //var userId = await wsManager.getUserId();
                        // Gérer l'inscription ici
                        var client = {
                          "Prenom": _prenomController.text,
                          "Nom": _nomController.text,
                          "Tel": _telController.text,
                          "Email": _emailController.text,
                          "password": _passwordController.text
                        };
                        print(client);
                        var response =
                            await new WsManager().createClient(client);
                        print('création client: ${response}');
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
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
                  primary: Color(0xFF7033FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InscriptionPage(),
  ));
}
