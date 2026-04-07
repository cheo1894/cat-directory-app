import 'package:cat_directory_app/domain/entities/breed_entity.dart';

class BreedModel {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;

  BreedModel({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });

  BreedModel copyWith({
    String? breed,
    String? country,
    String? origin,
    String? coat,
    String? pattern,
  }) => BreedModel(
    breed: breed ?? this.breed,
    country: country ?? this.country,
    origin: origin ?? this.origin,
    coat: coat ?? this.coat,
    pattern: pattern ?? this.pattern,
  );

  factory BreedModel.fromJson(Map<String, dynamic> json) => BreedModel(
    breed: json['breed'],
    country: json['country'],
    origin: json['origin'],
    coat: json['coat'],
    pattern: json['pattern'],
  );

  Map<String, dynamic> toJson() => {
    'breed': breed,
    'country': country,
    'origin': origin,
    'coat': coat,
    'pattern': pattern,
  };

  BreedEntity toEntity() {
    return BreedEntity(
      breed: breed,
      country: country,
      origin: origin,
      coat: coat,
      pattern: pattern,
    );
  }
}
