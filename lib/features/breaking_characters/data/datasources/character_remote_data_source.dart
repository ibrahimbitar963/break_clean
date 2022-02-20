

import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  /// Calls the https://www.breakingbadapi.com/api/{characters/1} endpoint.
  /// get only one character
  /// Throws a [ServerException] for all error codes.
  ///
  Future<CharacterModel> getOneCharacters(int id);
  /// Calls the  https://www.breakingbadapi.com/api/{characters} endpoint.
  ///get all character
  /// Throws a [ServerException] for all error codes.
  Future<CharacterModel> getAllCharacters();
}