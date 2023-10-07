class University {
  String name;
  List<String> webPages;

  University({required this.webPages, required this.name});

  // fromJson
  University.fromJson(Map<String, dynamic> json)
      : webPages = List<String>.from(json['web_pages']),
        name = json["name"];

  get university => null;

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'web_pages': webPages,
    };
  }

  List<University> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => University.fromJson(value)).toList();
  }
}
