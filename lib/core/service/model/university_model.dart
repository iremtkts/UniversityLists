class University {
  String name;
  List<String> webPages;

  University({
    required this.name,
    required this.webPages,
  });

  University.fromJson(Map<String, dynamic> json)
      : webPages = List<String>.from(json['web_pages']),
        name = json["name"];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'web_pages': webPages,
    };
  }

  @override
  String toString() {
    return 'University(name: $name , webPages: $webPages)';
  }
}
