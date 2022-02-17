import 'package:break_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
abstract class CharactersRepository {


 Future<Either<Failure, Character>> getOneCharacters(int id);
 Future<Either<Failure, Character>> getAllCharacters();



}
