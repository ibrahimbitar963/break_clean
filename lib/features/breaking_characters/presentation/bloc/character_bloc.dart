import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  late CharactersRepository charactersRepository;
  List<Character> characters = [];
  final GetAllCharacter getAllCharacter;
  CharacterState get initialState => Empty();
  late final Character character;

  CharacterBloc({required this.getAllCharacter}) : super(Empty()) {
    on<GetAllCharacter>((event, emit) async {

      Future<List<Character>> getAllCharacter()async{
       await charactersRepository.getAllCharacters()!.then((characters) {
          emit(Loaded(characters));
          this.characters = characters;
        });
        return characters;
      }
    });
    // on<GetAllCharacter>((event, emit) async {
    //   emit(Loading());
    //   final failureOrCharacter = await getAllCharacter(NoParams());
    //   failureOrCharacter!.fold((failure) {
    //     emit(Error(message: _mapFailureToMessage(failure)));
    //   }, (character) {
    //     emit(Loaded(character: character));
    //   });
    // });
  }

}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
