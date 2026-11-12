class Pokemon {
  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
  });

  final int id;
  final String name;

  // PokéAPI expresa la altura en decímetros y el peso en hectogramos.
  final int height;
  final int weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final height = json['height'];
    final weight = json['weight'];
    if (id is! int ||
        id <= 0 ||
        name is! String ||
        name.trim().isEmpty ||
        height is! int ||
        height < 0 ||
        weight is! int ||
        weight < 0) {
      throw const FormatException('Los datos del Pokémon no son válidos.');
    }
    return Pokemon(id: id, name: name, height: height, weight: weight);
  }
}
