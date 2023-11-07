class Character {
  final int id;
  final String name;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}