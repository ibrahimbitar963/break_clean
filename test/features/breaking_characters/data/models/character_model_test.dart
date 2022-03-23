import 'dart:convert';

import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tCharacterModel = CharacterModel(
      charID: 1, nickName: 'Walter White', actorName: 'Heisenberg',
      image: 'https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg',
      jobs:[
        "High School Chemistry Teacher",
        "Meth King Pin"
      ],
      appearance:  [
        1,
        2,
        3,
        4,
        5
      ],
      category: 'Breaking Bad',
  betterCallSaulAppearance: [],
      statusIfDeadOrAlive: 'Presumed dead'

  );
  test('should get character model', () async {
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
