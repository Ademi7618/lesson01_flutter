import 'package:lesson01_flutter/characher/domain/entities/page.dart';
import 'package:lesson01_flutter/characher/domain/repositories/i_characters_repository.dart';
import 'package:lesson01_flutter/characher/todo_data/datasources/i_characters_remote_datasource.dart';
import 'package:lesson01_flutter/characher/todo_data/utils/extentions.dart';

class CharactersRepository implements ICharactersRepository {
  final ICharactersRemoteDatasource charactersRemoteDatasource;
  const CharactersRepository(this.charactersRemoteDatasource);

  @override
  Future<Page> getCharacters(int page) async {
    final result = await charactersRemoteDatasource.getCharacters(page);
    return result.toDomain();
  }
}