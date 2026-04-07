class BreedEntity {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;

  BreedEntity({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });
  BreedEntity copyWith({
    String? breed,
    String? country,
    String? origin,
    String? coat,
    String? pattern,
  }) => BreedEntity(
    breed: breed ?? this.breed,
    country: country ?? this.country,
    origin: origin ?? this.origin,
    coat: coat ?? this.coat,
    pattern: pattern ?? this.pattern,
  );

  Map<String, String> toMap() => {
    'Breed': breed,
    'Country': country,
    'Origin': origin,
    'Coat': coat,
    'Pattern': pattern,
  };
}
