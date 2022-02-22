import 'dart:convert';

import 'package:break_clean/features/breaking_characters/data/datasources/character_local_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixture/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late CharacterLocalDataSourceImpl characterLocalDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    characterLocalDataSourceImpl =
        CharacterLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });
  group('get last character', () {
    final tCharacterModel =
        CharacterModel.fromJson(jsonDecode(fixture('characters.json')));
    test(
        'should return a cached character from shared preferences when there is one',
        () async* {
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('characters.json'));
      final result = characterLocalDataSourceImpl.getLastCharacter();
      verify(mockSharedPreferences.getString('CACHED_CHARACTER'));
      expect(result, equals(tCharacterModel));
    });
  });
}
