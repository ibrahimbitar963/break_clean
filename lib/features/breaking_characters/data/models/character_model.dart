import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';


class CharacterModel extends Character {
  CharacterModel({required int char_Id,
    required String nickName,
    required String actorName})
      : super(
    char_Id: char_Id,
    actorName: actorName,
    nickName: nickName,
  );


  factory CharacterModel.fromJson(Map <String, dynamic> json){
    return CharacterModel(nickName: json['nickname'],
        actorName: json['name'],
        char_Id: json['char_id']);
  }


}
