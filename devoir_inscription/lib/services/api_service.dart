import 'dart:convert';
import 'package:devoir_inscription/constants/app_constants..dart';
import '../models/inscription.dart';



class ApiService {
  static get http => null;

  static Future<List<Inscription>> fetchInscriptions({String? classe}) async {
    try {
      final query = classe != null ? '?classe=$classe' : '';
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.inscriptionsEndpoint}$query'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Inscription.fromJson(json)).toList();
      } else {
        throw Exception('Erreur de chargement des inscriptions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur de connexion à l\'API : $e');
    }
  }
}
