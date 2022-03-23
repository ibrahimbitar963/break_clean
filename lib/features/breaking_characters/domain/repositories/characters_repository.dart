import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:dartz/dartz.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();

  Future<Either<Failure, Character>> getOneCharacter(int id);
}
