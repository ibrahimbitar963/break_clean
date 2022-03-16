import 'dart:convert';
import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {

  //Future<CharacterModel>? getOneCharacters(int id);
  Future<List<CharacterModel>> getAllCharacter();

}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  //late GetAllCharacter getAllCharacter;
  late http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  Future<List<CharacterModel>> _getCharacterFromURL(String url) async {
    print('urlll');
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<CharacterModel> characters = List<CharacterModel>.from(json
          .decode(response.body));
      //.map((data) => CharacterModel.fromJson(data))).toList();
      characters.forEach((element) {
        //print(element.nickName);
        //  print(characters.length);
      });

      return characters;
    } else {
      throw Exception('Failed to load ');
    }
  }

  @override
  Future<List<CharacterModel>> getAllCharacter() async {
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
        //print(element.nickName);
      });

      return characters;
    } else {
      throw Exception('Failed to load ');
    }
  }

}



    // @override
    // Future<CharacterModel>? getOneCharacters(int id) async {
    //   final response = await client.get(
    //     Uri.parse('https://www.breakingbadapi.com/api/characters/$id'),
    //     headers: {'Content-Type': 'application/json'},
    //   );
    //   if (response.statusCode == 200) {
    //     return CharacterModel.fromJson(jsonDecode(response.body));
    //   } else {
    //     throw ServerException();
    //   }
    // }


    //Future<List<CharacterModel>> getAllCharacter() {



// @override
// Future<CharacterModel> getAllCharacter() {


// Future<List<dynamic>> getAllCharacters() async {
//   print('object');
//   try {
//     final response= await client.get(Uri.parse(''https://www.breakingbadapi.com/api/characters/''),
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

