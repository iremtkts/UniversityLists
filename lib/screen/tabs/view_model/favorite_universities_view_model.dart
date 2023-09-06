import 'package:flutter/material.dart';

class FavoriteUniversitiesViewModel extends ChangeNotifier {
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
}
