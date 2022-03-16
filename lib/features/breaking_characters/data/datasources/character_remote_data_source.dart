import 'dart:convert';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacter();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  late http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  Future<List<CharacterModel>> getCharacterFromURL(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<CharacterModel> characters =
          List<CharacterModel>.from(json.decode(response.body));

      characters.forEach((element) {});

      return characters;
    } else {
      throw Exception('Failed to load ');
    }
  }

  @override
  Future<List<CharacterModel>> getAllCharacter() async {
    final response = await client.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters/'),
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
}
