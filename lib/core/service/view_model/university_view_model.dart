import 'dart:math';

import 'package:university_lists/core/service/model/university_model.dart';
import 'package:university_lists/core/service/university_web_service.dart';

class UniversityViewModel {
  final University? _university;

  UniversityViewModel(this._university);

  University? get university => _university;
}

class UniversityListsViewModel {
  List<UniversityViewModel>? _universities;
  List<UniversityViewModel>? get universities => _universities;

  Future<void> fetchUniversities() async {
    try {
      final result = await WebService().fetchData();
      print(result);
      _universities = result.map((e) => UniversityViewModel(e)).toList();
    } catch (e) {
      print("bir hata oluştu : $e");
    }
  }
}
