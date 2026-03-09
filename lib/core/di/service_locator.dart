import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lesson01_flutter/characher/domain/presentation/bloc/characters_bloc.dart';
import 'package:lesson01_flutter/characher/domain/repositories/i_characters_repository.dart';
import 'package:lesson01_flutter/characher/domain/usecases/get_characters_usecase.dart';
import 'package:lesson01_flutter/characher/todo_data/datasources/characters_route_datasource.dart';
import 'package:lesson01_flutter/characher/todo_data/datasources/i_characters_remote_datasource.dart';
import 'package:lesson01_flutter/characher/todo_data/repositories/characters_repository.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl
    ..registerLazySingleton(
      () => GraphQLClient(
        link: HttpLink("https://rickandmortyapi.com/graphql"),
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    )
    ..registerLazySingleton<ICharactersRemoteDatasource>(
      () => CharactersRemoteDatasource(sl()),
    )
    ..registerLazySingleton<ICharactersRepository>(
      () => CharactersRepository(sl()),
    )
    ..registerLazySingleton(() => GetCharactersUsecase(sl()))
    ..registerLazySingleton(() => CharactersBloc(sl()));
}