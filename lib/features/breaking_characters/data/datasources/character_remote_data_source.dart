import 'dart:convert';
import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  /// Calls the https://www.breakingbadapi.com/api/{characters/1} endpoint.
  /// get only one character
  /// Throws a [ServerException] for all error codes.
  ///
  Future<CharacterModel>? getOneCharacters(int id);

  /// Calls the  https://www.breakingbadapi.com/api/{characters} endpoint.
  ///get all character
  /// Throws a [ServerException] for all error codes.
  Future<List<dynamic>> getAllCharacters();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  late http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});
  @override
  Future<List<dynamic>> getAllCharacters() async {
    print('object');
    final response = await client.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters/'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<CharacterModel> characters = new List<CharacterModel>.from(json
          .decode(response.body)
          .map((data) => CharacterModel.fromJson(data))).toList();
      characters.forEach((element) {
        print(element.nickName);
      });

      return characters;
    } else {
      throw Exception('Failed to load ');
    }
  }

  @override
  Future<CharacterModel>? getOneCharacters(int id) async {
    final response = await client.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return CharacterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

// Future<List<dynamic>> getAllCharacters() async {
//   print('object');
//   try {
//     final response= await client.get(Uri.parse('https://www.breakingbadapi.com/api/characters/'),
//       headers: {'Content-Type': 'application/json'},);
//
//     //   http.StreamedResponse response = await request.send();
//     print(response.toString());
//
//     var data = json.decode(response.body);
//     return  data;
//   } catch (e) {
//     print('eeeeeeeeeeeee');
//     print(e.toString());
//     return [];
//   }
}
