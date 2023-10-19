import 'package:flutter/material.dart';
import 'package:my_kaarway_full/Admin.dart';
import 'Chauffeur.dart'; // Assurez-vous que le fichier d'inscription des chauffeurs est correctement importé.
import 'redirections/ChauffeurRed.dart'; // Importez la page de redirection du chauffeur.
import 'package:my_kaarway_full/classes/wsManager.dart';

class ConnectionChauffeurPage extends StatefulWidget {
  @override
  _ConnectionChauffeurPageState createState() =>
      _ConnectionChauffeurPageState();
}

class _ConnectionChauffeurPageState extends State<ConnectionChauffeurPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  WsManager wsManager = WsManager();
  String _errorMessage =
      ''; // Ajoutez cette variable pour stocker le message d'erreur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ndamar Location',
          style: TextStyle(
            color: Colors.black, // Couleur du texte en noir
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
        backgroundColor: Colors.white, // Fond blanc de l'AppBar
      ),
      body: Stack(
        children: <Widget>[
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/white.png', // Remplacez 'background_image.jpg' par le chemin de votre image
                ),
                fit: BoxFit.cover, // Ajustez l'image pour couvrir tout l'écran
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Ajoutez l'image au-dessus de la page de connexion chauffeur
                  Image.asset(
                    'assets/toyota.png',
                    height:
                        200, // Réglez la hauteur de l'image en fonction de vos besoins
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    ' Connexion chauffeurs',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF5202CF),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              // Utilisez setState ici
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                  ),
                  Text(
                    _errorMessage, // Affiche le message d'erreur ici
                    style: TextStyle(
                      color:
                          Colors.red, // Couleur rouge pour le message d'erreur
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      var response = await wsManager.checkLogin(
                        _emailController.text,
                        _passwordController.text,
                      );
                      print("réponse:  + ${response}");
                      if (response == 'Admin') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AdminDashboard(),
                          ),
                        );
                      } else if (response == 'Chauffeur') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChauffeurRedPage(),
                          ),
                        );
                      } else {
                        print('Cet utilisateur n\'existe pas');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical:
                            20.0, // Augmentez la taille verticale du bouton
                        horizontal: 32.0,
                      ),
                      child: Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5202CF),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InscriptionChauffeurPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Pas encore inscrit ? Cliquez ici pour vous inscrire.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF5202CF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkLogin(BuildContext context, email, password) async {
    print('email: ${email}, password: ${password}');

    var response = await wsManager.checkLogin(email, password);
    print('réponse: ' + response);
    if (response == 'Admin') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AdminDashboard()),
      );
    } else if (response == 'Chauffeur') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ChauffeurRedPage()),
      );
    } else {
      print('Cet utilisateur n\'existe pas');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: ConnectionChauffeurPage(),
  ));
}
