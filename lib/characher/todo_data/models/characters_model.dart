import 'package:lesson01_flutter/characher/todo_data/models/Character_Model.dart';
import 'package:lesson01_flutter/characher/todo_data/models/page_model.dart';
import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class CharactersResponseModel {
  final PageModel info;
  final List<CharacterModel> results;
  const CharactersResponseModel(this.info, this.results);

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseModelToJson(this);
}
CharactersResponseModel _$CharactersResponseModelFromJson(
  Map<String, dynamic> json,
) => CharactersResponseModel(
  PageModel.fromJson(json['info'] as Map<String, dynamic>),
  (json['results'] as List<dynamic>)
      .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharactersResponseModelToJson(
  CharactersResponseModel instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};