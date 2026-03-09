import 'package:lesson01_flutter/characher/domain/entities/character.dart';
import 'package:lesson01_flutter/characher/domain/entities/page.dart';
import 'package:lesson01_flutter/characher/todo_data/models/Character_Model.dart';
import 'package:lesson01_flutter/characher/todo_data/models/characters_model.dart';

extension CharactersResponseModelExtentions on CharactersResponseModel {
  Page toDomain() =>
      Page(characters: results.toDomains(), next: info.next, prev: info.prev);
}

extension CharacterModelsExtentions on List<CharacterModel> {
  List<Character> toDomains() => map((model) => model.toDomain()).toList();
}

extension CharacterModelExtentions on CharacterModel {
  Character toDomain() => Character(
    name: name,
    status: status,
    species: species,
    image: image,
    lastKnownLocation: location.name,
    firstSeenIn: episode[0].name,
  );
}