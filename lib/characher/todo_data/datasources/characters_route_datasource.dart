

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lesson01_flutter/characher/todo_data/datasources/i_characters_remote_datasource.dart';
import 'package:lesson01_flutter/characher/todo_data/models/characters_model.dart';
import 'package:lesson01_flutter/characher/todo_data/models/page_model.dart';

class CharactersRemoteDatasource implements ICharactersRemoteDatasource {
  final GraphQLClient client;

  CharactersRemoteDatasource(this.client);

  @override
  Future<CharactersResponseModel> getCharacters(int page) async {
    const query = r'''
      query GetCharacters($page: Int){
        characters(page: $page) {
          info {
            next
            prev
          }
          results{
            name
            status
            species
            image
            location {
              name
            }
            episode {
              name
            }
          }
        }
      }
    ''';

    final result = await client.query(
      QueryOptions(document: gql(query), variables: {"page": page}),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final charactersResponseJson = result.data?["characters"];
    if (charactersResponseJson == null) {
      return const CharactersResponseModel(PageModel(null, null), []);
    }

    return CharactersResponseModel.fromJson(charactersResponseJson);
  }
}


