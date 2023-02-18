import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/models/ogretmen.dart';
import 'package:http/http.dart' as http;

class DataService {
  final String baseUrl = 'https://63e21396ad0093bf29c72f81.mockapi.io/';

  Future<Ogretmen> ogretmenIndir() async{
    final response = await http.get(Uri.parse('$baseUrl/ogretmen/1'));

    if (response.statusCode == 200) {
      return Ogretmen.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Ogretmen indirilemedi ${response.statusCode}');
    }
  }
}


final dataServiceProvider = Provider((ref) {
  return DataService();
});