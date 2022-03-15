import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:break_clean/injection_container.dart' as di;

part 'character_event.dart';
part 'character_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  late CharactersRepository charactersRepository;
  List<Character> characterss = [];
    GetAllCharacterEvent? getAllCharacter;
  CharacterState get initialState => Empty();
  //late final Character character;

  CharacterBloc() : super(Empty()) {
    on<GetAllCharacterEvent>((event, emit) async {
      di.sl<CharacterRemoteDataSource>().getAllCharacters();
      print('evennnnnnnnnnnnt');


      // Future<Either<Failure, List<Character>>>? getAllCharacter()async{
      //  await charactersRepository.getAllCharacters()!.then((characters) {
      //    Right(characters);
      //    print(characters.length());
      //    this.characterss = characters as List<Character>;
      //
      //   });
      //   return  Right(characterss);
      // }
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
