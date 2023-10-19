import 'dart:convert';
//import 'package:dio/dio.dart' as dio;
import 'package:my_kaarway_full/classes/session.dart' as session;
import 'package:http/http.dart' as http;

class WsManager {
  var base_url = 'http://192.168.5.126:8000/api/';

  createClient(client) async {
    try {
      final url = base_url + 'clients';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(client),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  createChauffeur(chauffeur) async {
    try {
      final url = base_url + 'chauffeurs';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(chauffeur),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        return serverResponse;
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response}');
        return 'Erreur';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }

  getUserId() async {
    return await session.getUserId();
  }

  Future<String> checkLogin(String username, String password) async {
    try {
      final url = base_url + 'users/login';
      var body = {
        'email': username,
        'password': password,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var serverResponse = jsonDecode(response.body);
        int userId = serverResponse['idUtilisateur'];
        String profile = serverResponse['profile'];
        session.setUserId(userId as int);
        session.setUserProfile(profile);

        if (profile == 'Admin') {
          return 'Admin';
        } else if (profile == 'client') {
          return 'client';
        } else if (profile == 'Chauffeur') {
          return 'Chauffeur';
        } else {
          return 'Type d\'utilisateur inconnu';
        }
      } else {
        print('statusCode : ${response.statusCode}');
        print('body : ${response.body}');
        return 'Erreur: ${response.body}';
      }
    } catch (error) {
      print('Erreur: $error');
      return 'Erreur: $error';
    }
  }
}
