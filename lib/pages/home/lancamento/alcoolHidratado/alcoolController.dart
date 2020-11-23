import 'dart:convert';
import 'package:http/http.dart' as http;

class AlcoolController {
  Future<Map> getAlcool({bool isDistilation}) async {
    http.Response response;
    var query;
    if (isDistilation == true) {
      query = "destilacao";
    } else {
      query = "analise";
    }
    response = await http.get("http://10.0.2.2:8080/$query/lista/todos");

    return json.decode(response.body);
  }
}
