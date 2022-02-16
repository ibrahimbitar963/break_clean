

import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';

class GetOneCharacter {


  final CharactersRepository repository;

  GetOneCharacter(this.repository);


  Future<Either<Failure, Character>> execute(int charId) async {
    return await repository.getOneCharacters();
  }
}