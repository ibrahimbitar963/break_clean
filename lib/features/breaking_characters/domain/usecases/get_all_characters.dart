import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCharacter implements UseCase<Character, NoParams> {
  final CharactersRepository repository;
  GetAllCharacter(this.repository);

  @override
  Future<Either<Failure , List<Character>>> call(NoParams params) async {
    return await repository.getAllCharacters();
  }


}
