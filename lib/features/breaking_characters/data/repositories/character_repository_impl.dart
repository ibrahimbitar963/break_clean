

import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/platform/network_info.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_local_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharactersRepository{
  late final CharacterRemoteDataSource remoteDataSource ;
  late final CharacterLocalDataSource localDataSource ;
  late final NetworkInfo networkInfo ;

  CharacterRepositoryImpl({required this.networkInfo,required this.remoteDataSource,required this.localDataSource});
  @override
  Future<Either<Failure, Character>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Character>>  getOneCharacters(int id ) async {


    networkInfo.isConnected;
    return Right(await remoteDataSource.getOneCharacters(id)!);


  }
  

  
}