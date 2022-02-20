
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';

abstract class CharacterLocalDataSource {
  /// Gets the cached [CharacterModel] which was gotten the last time
  /// the user had an internet connection.
  /// Throws [NoLocalDataException] if no cached data is present.

Future<CharacterModel> getLastCharacter();
Future <void> cachedCharacter(CharacterModel characterToCache);

}