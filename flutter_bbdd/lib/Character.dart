class Character {
  final int? id;
  final String name;
  final String image;

  Character({
    this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Character{id: $id, name: $name, image: $image}';
  }
}