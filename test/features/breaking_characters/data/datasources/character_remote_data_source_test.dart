import 'dart:convert';

import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:matcher/matcher.dart';
import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixture/fixture_reader.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late CharacterRemoteDataSourceImpl characterRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    characterRemoteDataSourceImpl =
        CharacterRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get character', () {
    final tCharacterNumber = 1;
    final tCharacterModel = CharacterModel.fromJson(
      jsonDecode(
        fixture('characters.json'),
      ),
    );
    test(
        'should preform a GET request on a URL with character being the endpoint and with application/json header',
        () async* {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('characters.json'), 200));
      characterRemoteDataSourceImpl.getAllCharacter();
      verify(
        mockHttpClient.get(
          Uri.parse(
              'https://www.breakingbadapi.com/api1/characters/$tCharacterNumber'),
          headers: {'Content-Type': 'application/json'},
        ),
      );
    });
    test('should return Character when the response code is 200 (success)',
        () async* {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('characters.json'), 200));
      final result = await characterRemoteDataSourceImpl
          .getAllCharacter();
      expect(result, equals(tCharacterModel));
    });

    test('should throw a ServerException when the response code is 404 or other', ()async*{
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
              (_) async => http.Response('Something went wrong',400));
            
            final call = characterRemoteDataSourceImpl.getAllCharacter();
            
            expect(()=>call, throwsA(TypeMatcher<ServerException>()));

    });
  });
}
