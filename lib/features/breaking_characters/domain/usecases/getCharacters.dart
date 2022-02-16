import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCharacters implements UseCase<Character,NoParams> {

late  final CharactersRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure,Character >> call(NoParams noParams) async{

    return await repository.getCharacters();
  }
}

