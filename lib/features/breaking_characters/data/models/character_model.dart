import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';


class CharacterModel extends Character {
  CharacterModel({required int char_Id,
    required String nickName,
    required String actorName,
  required image, required jobs, required StatusIfDeadOrAlive,
  required appearance , required category, required better_call_saul_appearance
  })
      : super(
    char_Id: char_Id,
    actorName: actorName,
    nickName: nickName,
    image: image,
    jobs: jobs,
    better_call_saul_appearance: better_call_saul_appearance,
    StatusIfDeadOrAlive: StatusIfDeadOrAlive,
    appearance: appearance,
    category: category,

  );


  factory CharacterModel.fromJson(Map <String, dynamic> json){
    return CharacterModel(
      category: json['category'],
      appearance: json['appearance'],
      StatusIfDeadOrAlive: json['status'] ,
      better_call_saul_appearance:json['better_call_saul_appearance'] ,
      jobs: json['occupation'] ,
      image: json['img'] ,
      char_Id: json['char_id'] ,
      actorName: json['nickname'] ,
      nickName: json['name'],

    );
  }


}
