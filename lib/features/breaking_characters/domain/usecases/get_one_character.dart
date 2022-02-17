import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetOneCharacter implements UseCase<Character,Params> {
  final CharactersRepository repository;
  GetOneCharacter(this.repository);

@override
  Future<Either<Failure, Character>> call(Params params)
  async {
    return await repository.getOneCharacters(params.charId);
  }
}
class Params extends Equatable  {
  final int charId;
  Params({required this.charId});

  @override
  List<Object> get props => [charId];


}