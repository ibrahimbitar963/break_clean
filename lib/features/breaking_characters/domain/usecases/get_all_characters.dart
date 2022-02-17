import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAllCharacter implements UseCase<Failure, NoParams>{
  final CharactersRepository repository;
  GetAllCharacter(this.repository);
  @override
  Future<Either<Failure, Failure>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}