
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta_meta.dart';
import 'package:meta/meta.dart';
class GetOneCharacter {


  final CharactersRepository repository;

  GetOneCharacter(this.repository);


  Future<Either<Failure, Character>> execute(int charId) async {
    return await repository.getOneCharacters(charId);
  }
}