import 'dart:convert';
import 'dart:io';
import 'package:break_clean/core/error/exception.dart';
import 'package:http/http.dart'as http;
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  /// Calls the https://www.breakingbadapi.com/api/{characters/1} endpoint.
  /// get only one character
  /// Throws a [ServerException] for all error codes.
  ///
  Future<CharacterModel>? getOneCharacters(int id);
  /// Calls the  https://www.breakingbadapi.com/api/{characters} endpoint.
  ///get all character
  /// Throws a [ServerException] for all error codes.
  Future<CharacterModel> getAllCharacters();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource{
       late http.Client  client;

  CharacterRemoteDataSourceImpl({required this.client});
  @override
  Future<CharacterModel> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

  @override
  Future<CharacterModel>? getOneCharacters(int id) async{
    final response=
    await client.get(Uri.parse('https://www.breakingbadapi.com/api/characters/$id'),
    headers: {'Content-Type': 'application/json'},);
    if(response.statusCode == 200){
    return CharacterModel.fromJson(jsonDecode(response.body));
  }else
  {throw ServerException();}

  }
}