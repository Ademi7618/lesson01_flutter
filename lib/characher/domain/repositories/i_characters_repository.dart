import 'package:lesson01_flutter/characher/domain/entities/page.dart';

abstract class ICharactersRepository {
  Future<Page> getCharacters(int page);
}