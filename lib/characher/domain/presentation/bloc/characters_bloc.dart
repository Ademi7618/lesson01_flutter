import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson01_flutter/characher/domain/entities/character.dart';
import 'package:lesson01_flutter/characher/domain/presentation/bloc/characters_event.dart';
import 'package:lesson01_flutter/characher/domain/presentation/bloc/characters_state.dart';
import 'package:lesson01_flutter/characher/domain/usecases/get_characters_usecase.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUsecase getCharactersUsecase;
  int? nextPage = 0;
  List<Character> characters = [];
  CharactersBloc(this.getCharactersUsecase) : super(CharactersInitial()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<LoadNextPageEvent>(_onLoadNextPage);
  }

  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (characters.isEmpty) {
      emit(CharactersLoading());
    }

    if (state is CharactersLoadedSuccess) {
      emit(
        CharactersLoadedSuccess(characters: characters, isLoadingMore: true),
      );
    }

    final result = await getCharactersUsecase(event.page);
    nextPage = result.next;
    characters.addAll(result.characters);
    emit(CharactersLoadedSuccess(characters: characters));
  }

  Future<void> _onLoadNextPage(
    LoadNextPageEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (nextPage != null) {
      add(LoadCharactersEvent(nextPage!));
    }
  }
}