import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/network/network_info.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';
typedef Future<List<CharacterModel>> _ConcreteOrRandomChooser();
class CharacterRepositoryImpl implements CharactersRepository {
  late final CharacterRemoteDataSource remoteDataSource;

  // late final CharacterLocalDataSource localDataSource;

  late final NetworkInfo networkInfo;

  CharacterRepositoryImpl({required this.networkInfo,
    required this.remoteDataSource,
    });

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    return await _getTrivia(() {
      return remoteDataSource.getAllCharacter();
    });
  }

  @override


  Future<Either<Failure, List<Character>>> _getTrivia(
      _ConcreteOrRandomChooser getConcreteOrRandom) async {
     if (await networkInfo.isConnected!) {
    try {
      final remoteTrivia = await getConcreteOrRandom();
      remoteDataSource.getAllCharacter();
      return Right(remoteTrivia);
    } on ServerException {
      return Left(ServerFailure());
    }
    // }
    // {
    //   try {
    //     final localTrivia = await localDataSource.getLastCharacter();
    //     return Right(localTrivia!);
    //   } on CacheException {
    //     return Left(CacheFailure());
    //   }
    // }
    // }
  }else {
       return Left(CacheFailure());
     }
     }

}