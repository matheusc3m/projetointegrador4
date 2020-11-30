import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardController {
  Future<Map> getAlcool() async {
    http.Response response;

    response =
        await http.get("http://10.0.2.2:8080/destilacao/lista/mediaDashboard");

    return json.decode(response.body);
  }
}
