import 'package:break_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';

/// The contract which will be implemented to write the test.
abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();

  Future<Either<Failure, Character>> getOneCharacter(int id);
}
