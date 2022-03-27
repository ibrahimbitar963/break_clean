import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:break_clean/core/const/strings.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:break_clean/injection_container.dart' as di;
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  late CharactersRepository charactersRepository;
  late Future<List<CharacterModel>> characters;
  CharacterState get initialState => CharactersBloc();

  CharacterBloc(CharacterRepositoryImpl characterRepo) : super(CharactersBloc()) {
    on<GetAllCharacterEvent>((event, emit) async {
      characters = di.sl<CharacterRemoteDataSource>().getAllCharacter();
    });
  }
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return UNEXPECTED_ERROR;
  }
}
