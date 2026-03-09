import 'package:lesson01_flutter/characher/todo_data/models/characters_model.dart';

abstract class ICharactersRemoteDatasource {
  Future<CharactersResponseModel> getCharacters(int page);
}