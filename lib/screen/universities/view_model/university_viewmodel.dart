import 'dart:async';

import 'package:university_lists/base/view_model/base_view_model.dart';

import 'package:university_lists/models/university_model.dart';

import 'package:university_lists/screen/universities/university_service.dart';

class UniversityListsViewModel extends BaseViewModel {
  List<University>? _universities;
  List<University>? get universities => _universities;
  final _service = UniversityService();

  @override
  FutureOr<void> init() async => await fetchData();

  Future<void> fetchData() async {
    try {
      _universities = await _service.fetchAllUniversities();
    } catch (e) {
      print("Bir hata oluştu: $e");
    }
  }
}
