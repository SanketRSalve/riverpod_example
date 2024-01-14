class CharacterModel {
  final int? id;
  final String? name;
  final String? species;
  final String? imageUrl;
  const CharacterModel({
    this.id,
    this.name,
    this.species,
    this.imageUrl,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> data) {
    return CharacterModel(
      id: data['id'] ?? 0,
      name: data['name'] ?? '',
      species: data['species'] ?? '',
      imageUrl: data['image'] ?? '',
    );
  }
}
