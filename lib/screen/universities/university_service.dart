import 'dart:convert';

import 'package:university_lists/base/service/base_service.dart';
import 'package:university_lists/models/university_model.dart';

class UniversityService extends BaseService {
  static const String url =
      "http://universities.hipolabs.com/search?country=Turkey";
  Future<List<University>> fetchAllUniversities() async {
    try {
      final response = await fetchData(url);
      final universities = jsonDecode(response.data) as List;
      return universities
          .map((university) => University.fromJson(university))
          .toList();
    } catch (error) {
      print("Error fetching universities: $error");
      throw Exception("Error fetching universities");
    }
  }
}
