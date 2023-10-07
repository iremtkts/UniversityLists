import 'dart:async';
import 'package:university_lists/base/view_model/base_view_model.dart';

class FavoriteUniversitiesViewModel extends BaseViewModel {
  Set<String> favoriteUniversityNames = {};

  bool isFavorite(String universityName) {
    return favoriteUniversityNames.contains(universityName);
  }

  void toggleFavorites(String universityName) {
    if (isFavorite(universityName)) {
      favoriteUniversityNames.remove(universityName);
    } else {
      favoriteUniversityNames.add(universityName);
    }

    notifyListeners();
  }

  List<String> getFavorites() {
    return favoriteUniversityNames.toList();
  }

  @override
  FutureOr<void> init() {}
}
