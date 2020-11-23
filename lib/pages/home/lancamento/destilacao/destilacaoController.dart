import 'dart:convert';

import 'package:http/http.dart' as http;

class DestilacaoController {
  Future<String> addData(Map<String, dynamic> request) async {
    final url = 'http://10.0.2.2:8080/destilacao';
    try {
      final response = await http.post(url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: jsonEncode(request));
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      return responseData['message'];
    } catch (error) {
      throw error;
    }
  }
}
