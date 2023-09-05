import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:university_lists/core/service/model/university_model.dart';

class WebService {
// url : http://universities.hipolabs.com/search?country=Turkey
  Future<List<University>> fetchData() async {
    String url = "http://universities.hipolabs.com/search?country=Turkey";
    final dataResponse = await http.get(Uri.parse(url));
    if (dataResponse.statusCode == 200) {
      final json = jsonDecode(dataResponse.body) as List<dynamic>;
      final result = json.map((e) => University.fromJson(e)).toList();
      return result;
    } else {
      throw Exception("Error fetch data");
    }
  }
}
