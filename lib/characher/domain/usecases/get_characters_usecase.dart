import 'package:lesson01_flutter/characher/domain/entities/page.dart';
import 'package:lesson01_flutter/characher/domain/repositories/i_characters_repository.dart';

class GetCharactersUsecase {
  final ICharactersRepository repository;
  const GetCharactersUsecase(this.repository);
  Future<Page> call(int page) => repository.getCharacters(page);
}