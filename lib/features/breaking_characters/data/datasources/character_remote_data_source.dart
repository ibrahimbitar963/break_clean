import 'dart:convert';
import 'package:break_clean/core/const/strings.dart';
import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacter();
  Future<Character>? getOneCharacter(int id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  late http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getAllCharacter() async {
    final response = await client.get(
      Uri.parse(API_URL),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<CharacterModel> characters = new List<CharacterModel>.from(json
          .decode(response.body)
          .map((data) => CharacterModel.fromJson(data))).toList();

      characters.forEach((element) {});

      return characters;
    } else {
      throw Exception('Failed to load ');
    }
  }

  @override
  Future<Character> getOneCharacter(int id) async{
    final response=
    await client.get(Uri.parse('https://www.breakingbadapi.com/api/characters/$id'),
      headers: {'Content-Type': 'application/json'},);
    if(response.statusCode == 200){
      return CharacterModel.fromJson(jsonDecode(response.body));
    }else
    {throw ServerException();}

  }
}
