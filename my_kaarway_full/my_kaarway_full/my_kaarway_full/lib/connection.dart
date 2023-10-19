import 'package:flutter/material.dart';
import 'package:my_kaarway_full/Inscription.dart';
import 'package:my_kaarway_full/Admin.dart';
import 'package:my_kaarway_full/redirections/Chauffeurred.dart';
import 'package:my_kaarway_full/classes/wsManager.dart';
import 'main.dart';

class ConnectionPage extends StatefulWidget {
  // Convertissez ConnectionPage en StatefulWidget
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  WsManager wsManager = WsManager();
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ndamar Location',
          style: TextStyle(
            color: Colors.black,
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
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/white.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/toyota.png',
                  height: 200,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
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
                    color: Colors.red, // Couleur rouge pour le message d'erreur
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
                    } else if (response == 'client') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
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
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5202CF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 40.0,
                    ),
                    child: Text(
                      'Se connecter',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InscriptionPage(),
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
    } else if (response == 'client') {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const HomePage(
                //username: '',
                )),
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
