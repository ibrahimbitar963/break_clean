

import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharactersRepository{
  @override
  Future<Either<Failure, Character>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Character>> getOneCharacters(int id) {
    // TODO: implement getOneCharacters
    throw UnimplementedError();
  }
  
  
  
  
}