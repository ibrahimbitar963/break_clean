import 'dart:convert';

import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tCharacterModel = CharacterModel(
      char_Id: 1, nickName: 'Walter White', actorName: 'Heisenberg');
  test('should get character model', () async* {
    expect(tCharacterModel, isA<Character>());
  });

  group('from json', () {
    test('should return a valid model when the json number is ant integer',
        () async* {
      //arrange

      final Map< String , dynamic > jsonMap = jsonDecode(
        fixture('characters.json'),
      );

      //act

      final result = CharacterModel.fromJson(jsonMap);

      //assert

      expect(result, tCharacterModel);
    });
  });
}
