import 'dart:convert';
import 'package:break_clean/core/const/strings.dart';
import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CharacterLocalDataSource {

  /// Gets the cached [CharacterModel] which was gotten the last time
  /// the user had an internet connection.
  /// Throws [NoLocalDataException] if no cached data is present.
    Future<Character>? getLastCharacter();
    Future <void>? cachedCharacter(Character characterToCache);
}


class CharacterLocalDataSourceImpl implements CharacterLocalDataSource{
 late final SharedPreferences sharedPreferences;
 CharacterLocalDataSourceImpl({ required this.sharedPreferences});

  @override
  Future<void>? cachedCharacter(Character characterToCache) {
  return sharedPreferences.setString(CACHED_CHARACTER,
      json.encode(characterToCache));
  }

  @override
  Future<CharacterModel>? getLastCharacter() {
    var jsonString = sharedPreferences.getString(CACHED_CHARACTER);
    if(jsonString != null){
      return Future.value(CharacterModel.fromJson(jsonDecode(jsonString)));

    }else {
      throw CacheException();
    }
  }
}