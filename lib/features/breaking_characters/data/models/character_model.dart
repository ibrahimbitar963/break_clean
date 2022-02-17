import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:flutter/cupertino.dart';

class CharacterModel extends Character {
  CharacterModel(
      {required int char_Id,
      required String nickName,
      required String actorName})
      : super(
          char_Id: char_Id,
          actorName: actorName,
          nickName: nickName,
        );
}
