import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';

class CharacterModel extends Character {
  CharacterModel(
      {required int charID,
      required String nickName,
      required String actorName,
      required image,
      required jobs,
      required statusIfDeadOrAlive,
      required appearance,
      required category,
      required betterCallSaulAppearance})
      : super(
          charID: charID,
          actorName: actorName,
          nickName: nickName,
          image: image,
          jobs: jobs,
          betterCallSaulAppearance: betterCallSaulAppearance,
          statusIfDeadOrAlive: statusIfDeadOrAlive,
          appearance: appearance,
          category: category,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      category: json['category'],
      appearance: json['appearance'],
      statusIfDeadOrAlive: json['status'],
      betterCallSaulAppearance: json['better_call_saul_appearance'],
      jobs: json['occupation'],
      image: json['img'],
      charID: json['char_id'],
      actorName: json['nickname'],
      nickName: json['name'],
    );
  }
}
