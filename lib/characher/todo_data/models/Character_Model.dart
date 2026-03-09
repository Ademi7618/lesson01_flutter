import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class CharacterModel {
  final String name;
  final String status;
  final String species;
  final String image;
  final LocationModel location;
  final List<EpisodeModel> episode;

  const CharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.location,
    required this.episode,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final String name;

  const LocationModel(this.name);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class EpisodeModel {
  final String name;

  const EpisodeModel(this.name);

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}


CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      image: json['image'] as String,
      location: LocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      episode: (json['episode'] as List<dynamic>)
          .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'image': instance.image,
      'location': instance.location,
      'episode': instance.episode,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(json['name'] as String);

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{'name': instance.name};

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) =>
    EpisodeModel(json['name'] as String);

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{'name': instance.name};