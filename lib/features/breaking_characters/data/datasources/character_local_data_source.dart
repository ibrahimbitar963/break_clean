import 'dart:convert';

import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CharacterLocalDataSource {
  /// Gets the cached [CharacterModel] which was gotten the last time
  /// the user had an internet connection.
  /// Throws [NoLocalDataException] if no cached data is present.

Future<CharacterModel>? getLastCharacter();
Future <void>? cachedCharacter(CharacterModel characterToCache);



}
class CharacterLocalDataSourceImpl implements CharacterLocalDataSource{
 late final SharedPreferences sharedPreferences;
 CharacterLocalDataSourceImpl({ required this.sharedPreferences});
  @override
  Future<void>? cachedCharacter(CharacterModel characterToCache) {
    // TODO: implement cachedCharacter
    throw UnimplementedError();
  }

  @override
  Future<CharacterModel>? getLastCharacter() {

    final jsonString = sharedPreferences.getString('CACHED_CHARACTER');
     return Future.value(CharacterModel.fromJson(jsonDecode(jsonString!)));

  }


}