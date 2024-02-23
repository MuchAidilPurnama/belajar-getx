class Kategori {
  int? id;
  String? name;

  Kategori({
    required this.id,
    required this.name,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      name: json['name'],
    );
  }
}