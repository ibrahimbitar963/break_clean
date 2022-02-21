import 'package:break_clean/core/platform/network_info.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_local_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements CharacterLocalDataSource {}

class MockRemoteDataSource extends Mock implements CharacterRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([NetworkInfo])
// @GenerateMocks([NumberTriviaRemoteDataSource])
@GenerateMocks([
  CharacterRemoteDataSource
], customMocks: [
  MockSpec<CharacterRemoteDataSource>(
      as: #MockNumberTriviaRemoteDataSourceForTest,
      returnNullOnMissingStub: true),
])

void main() {
  late CharacterRepositoryImpl repositoryImpl;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CharacterRepositoryImpl(
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
    );
  });
  group('get character', () {
    final tCharacterNumber = 1;
    final tCharacterModel = CharacterModel(
        char_Id: 1, nickName: 'Heisenberg', actorName: 'Walter White');

    final Character tCharacter = tCharacterModel;
    test('checkkkkkkkkkkkkk if the device online', () async* {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repositoryImpl.getOneCharacters(tCharacterNumber);
      verify(mockNetworkInfo.isConnected);
    });
    
    group('device is online', (){

      setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('should return remote data when the call to remote data source is success ',

          ()async{
        when(mockRemoteDataSource.getOneCharacters(1))
            .thenAnswer((_)async => tCharacterModel);

            final result =  await repositoryImpl.getOneCharacters(tCharacterNumber);
        verify(mockRemoteDataSource.getOneCharacters(1));
        expect(result, equals(Right(tCharacter)));



          }
      );
    });



  });
}


// group('device online', ()async* {
//
//     when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//   test('should get data if the device is online', () async* {
//     when(mockRemoteDataSource.getOneCharacters(tCharacterNumber))
//         .thenAnswer((_) async => tCharacterModel);
//     final result = await repositoryImpl.getOneCharacters(tCharacterNumber);
//     expect(result, equals(Right(tCharacter)));
//     verify(mockRemoteDataSource.getOneCharacters(tCharacterNumber));
//   });
// });

//     group('device offline', () {
//       setUp(() {
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
// // test(description, body)
//       });
//     });
//     test('should check if the device is online', () async {
//       //arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       //act
//       repositoryImpl.getOneCharacters(tCharacterNumber);
//       //assert
//       verify(mockNetworkInfo.isConnected);
//     });