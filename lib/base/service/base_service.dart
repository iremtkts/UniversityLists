import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:university_lists/base/service/response_model.dart';



class BaseService {
  

  Future<ResponseModel> fetchData(String path) async {
    try {
      final response = await http.get(Uri.parse(path));
      if (response.statusCode == 200) {
        return ResponseModel(isSuccess: true, data: response.body);
      } else {
        return ResponseModel(
            isSuccess: false,
            errorMessage: "Connection failed by ${response.statusCode}");
      }
    } catch (exception) {
      return ResponseModel(errorMessage: "Fetch Data Error");
    }

  }
}


