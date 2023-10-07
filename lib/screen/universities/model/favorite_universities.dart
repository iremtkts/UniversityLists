class FavoriteUniversitiesModel {
  final String _universityName;
  bool _isFavorite;

  FavoriteUniversitiesModel(
      {required String universityName, bool isFavorite = false})
      : _universityName = universityName,
        _isFavorite = isFavorite;

  String get universityName => _universityName;
  bool get isFavorite => _isFavorite;

  set isFavorite(bool value) {
    _isFavorite = value;
  }
}
