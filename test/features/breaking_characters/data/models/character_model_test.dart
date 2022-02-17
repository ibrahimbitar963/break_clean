

import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main (){

final tCharacterModel = CharacterModel(char_Id: 1, nickName: 'Walter White', actorName:'Heisenberg' );
test('should get character model',
        ()async*{

      expect(tCharacterModel, isA<Character>());
}

);


}
