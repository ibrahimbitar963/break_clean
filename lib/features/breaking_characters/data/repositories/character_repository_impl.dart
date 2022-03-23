import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/network/network_info.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_local_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<List<CharacterModel>> _CharacterOrCache();

class CharacterRepositoryImpl implements CharactersRepository {
  late final CharacterRemoteDataSource remoteDataSource;
  late final CharacterLocalDataSource localDataSource;

  late final NetworkInfo networkInfo;

  CharacterRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {

    return await getChar(() {
      return remoteDataSource.getAllCharacter();
    });
  }

  Future<Either<Failure, List<Character>>> getChar(
      _CharacterOrCache getConcreteOrRandom) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteChar = await getConcreteOrRandom();
        remoteDataSource.getAllCharacter();
        return Right(remoteChar);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Character>> getOneCharacter(int id) async {
    try {
      networkInfo.isConnected;
      final remoteCache = await remoteDataSource.getOneCharacter(id)!;
      localDataSource.cachedCharacter(remoteCache);
      return Right(remoteCache);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
